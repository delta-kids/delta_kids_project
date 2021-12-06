class Event < ApplicationRecord
  serialize :recurring, Hash
  before_save :save_dates
  after_update :send_approved_event_email, :if => :approved_changed?

  def save_dates
    self.start_date = self.start_time.strftime("%Y/%m/%d")
    self.end_date = self.end_time.strftime("%Y/%m/%d")
  end

  def send_approved_event_email
    PendingEventMailer.approved_event_email(self).deliver!
  end

  def recurring=(value)
    if value == "null"
      super(nil)
    elsif RecurringSelect.is_valid_rule?(value)
        super(RecurringSelect.dirty_hash_to_rule(value).to_hash)
    else
        super(nil)
    end
  end

  def rule
    IceCube::Rule.from_hash recurring
  end

  def schedule(start)
    schedule = IceCube::Schedule.new(start)
    schedule.add_recurrence_rule(rule)
    schedule
  end

  def calendar_events(start_d, end_d)
    if recurring.empty?
        [self]
    else
        schedule(self.start_time).occurrences_between(start_d, end_d + 1.day).map do |date|
            Event.new(id: id, title: title, start_time: date, end_time: date, description: description, address: address)
        end
    end
  end

  scope :by_start_date, -> start_date {
    where('start_date >= (?)', start_date)
    .or(where('start_date <= (?) AND end_date >= (?)', start_date, start_date))}

  scope :by_end_date, -> end_date {
    where('end_date <= (?)', end_date)
    .or(where('start_date <= (?) AND end_date >= (?)', end_date, end_date)) }

  scope :search, -> term {
    if self.has_attribute?(:event_type_id)
      includes(:tags).where('tags.name ILIKE (?) OR title ILIKE (?) OR description ILIKE (?) OR address ILIKE (?)', "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%").order('title ASC')
    end
  }

  scope :event_location, -> location_id { Event.includes(:locations).where(:locations => {:id => location_id}) }
  scope :approved, -> { where(approved: true) }
  scope :registration, -> registration { where(:registration => registration) }
  scope :cost, -> cost { where(:cost => cost) }
  scope :event_type, -> event_type { where(:event_type_id => event_type) }
  scope :age_group, -> age_id { Event.includes(:age_groups).where(:age_groups => {:id => age_id}) }


  mount_uploader :image, ImageUploader
  mount_uploader :pdf_file, ImageUploader

  has_many :EventTaggings, dependent: :destroy
  has_many :tags, through: :EventTaggings

  has_many :EventAgeGroups, dependent: :destroy
  has_many :age_groups, through: :EventAgeGroups
  has_many :event_locations, dependent: :destroy
  has_many :locations, through: :event_locations

  belongs_to :user, optional: true
  belongs_to :event_type

  geocoded_by :address
  after_validation :geocode

  def location_names
    locations.collect(&:name).join(', ')
  end

  def status
    case approved
    when true
      "approved"
    when false
      "declined"
    else
      "pending"
    end
  end

end
