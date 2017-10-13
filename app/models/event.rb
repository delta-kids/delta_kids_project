class Event < ApplicationRecord
  # belongs_to :organization, :class, optional: true

  # scope :by_date, -> (start_date: Date.current() - 9999.years, end_date: Date.current() + 9999.years) { where(start_date: start_date..end_date, end_date: start_date..end_date) }
  scope :by_date, -> start_date, end_date { where("start_date = ? AND end_date = ?", start_date, end_date) }
  scope :event_location, -> event_location { where(:event_location => event_location) }
  scope :registration, -> registration { where(:registration => registration) }
  scope :cost, -> cost { where(:cost => cost) }
  scope :program_type, -> program_type_id { Event.includes(:program_types).where(:program_types => {:id => program_type_id})}
  scope :event_age_group, -> age_id { Event.includes(:age_groups).where(:age_groups => {:id => age_id})}

  mount_uploader :image, ImageUploader

  has_many :EventTaggings, dependent: :destroy
  has_many :tags, through: :EventTaggings

  has_many :EventAgeGroups, dependent: :destroy
  has_many :age_groups, through: :EventAgeGroups

  has_many :EventProgramTypes, dependent: :destroy
  has_many :program_types, through: :EventProgramTypes

  geocoded_by :address
  after_validation :geocode

  geocoded_by :address
  after_validation :geocode

  def self.search(term)
    if term
      where('title ILIKE ?', "%#{term}%").order('title ASC')
    else
      order('title ASC')
    end
  end
end
