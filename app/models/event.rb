class Event < ApplicationRecord
  # belongs_to :organization, :class, optional: true

  # scope :by_date, -> (start_date: Date.current() - 9999.years, end_date: Date.current() + 9999.years) { where(start_date: start_date..end_date, end_date: start_date..end_date) }
  scope :by_start_date, -> start_date { where(['start_date >= ?', start_date])  }
  scope :by_end_date, -> end_date { where(['start_date <= ?', end_date]) }
  scope :search, -> term {
    if self.has_attribute?(:event_type_id)
      where('title ILIKE (?) OR description ILIKE (?)', "%#{term}%", "%#{term}%").order('title ASC')
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
  scope :age_group, -> age_id { includes(:age_groups).where(:age_groups => {:id => age_id}) }

  mount_uploader :image, ImageUploader

  has_many :EventTaggings, dependent: :destroy
  has_many :tags, through: :EventTaggings

  has_many :EventAgeGroups, dependent: :destroy
  has_many :age_groups, through: :EventAgeGroups

  belongs_to :event_type

  geocoded_by :address
  after_validation :geocode




end
