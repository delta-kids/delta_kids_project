class Event < ApplicationRecord
  serialize :recurring, Hash

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

def calendar_events(start)
  if recurring.empty?
      [self]
  else
      schedule(start_time).occurrences(end_time).map do |date|
          Event.new(id: id, title: title, start_time: date)
      end
  end
end



  scope :by_start_date, -> start_date { where(['start_date >= ?', start_date])  }
  scope :by_end_date, -> end_date { where(['start_date <= ?', end_date]) }
  scope :search, -> term {
    if self.has_attribute?(:event_type_id)
      joins(:tags).where('tags.name ILIKE (?) OR title ILIKE (?) OR description ILIKE (?)', "%#{term}%", "%#{term}%", "%#{term}%").order('title ASC')
    elsif self.has_attribute?(:program_type_id)
      where('description ILIKE (?)', "%#{term}%").order('description ASC')
    elsif self.has_attribute?(:service_type_id)
      where('description ILIKE (?)', "%#{term}%").order('description ASC')
  end
}
  scope :event_location, -> event_location { where(:event_location => event_location) }
  scope :approved, -> approved { where(:approved => true) }
  scope :registration, -> registration { where(:registration => registration) }
  scope :cost, -> cost { where(:cost => cost) }
  scope :event_type, -> event_type { where(:event_type_id => event_type) }
  scope :age_group, -> age_id { Event.includes(:age_groups).where(:age_groups => {:id => age_id}) }


  mount_uploader :image, ImageUploader

  has_many :EventTaggings, dependent: :destroy
  has_many :tags, through: :EventTaggings

  has_many :EventAgeGroups, dependent: :destroy
  has_many :age_groups, through: :EventAgeGroups

  belongs_to :user, optional: true
  belongs_to :event_type

  geocoded_by :address
  after_validation :geocode




end
