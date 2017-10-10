class Event < ApplicationRecord
  # belongs_to :organization, :class, optional: true
  # scope :by_date, -> (start_date: Date.current() - 9999.years, end_date: Date.current() + 9999.years) { where(start_date: start_date..end_date, end_date: start_date..end_date) }
  scope :by_date, -> start_date, end_date { where("start_date = ? AND end_date = ?", start_date, end_date) }
  scope :event_location, -> event_location { where(:event_location => event_location) }
  scope :registration, -> registration { where(:registration => registration) }
  scope :cost, -> cost { where(:cost => cost) }
  scope :age_groups, -> age_groups { Event.joins(:age_groups).where(:age_groups => {id: age_groups })}

  mount_uploader :image, ImageUploader

  has_many :EventTaggings, dependent: :destroy
  has_many :tags, through: :EventTaggings

  has_many :EventAgeGroups, dependent: :destroy
  has_many :age_groups, through: :EventAgeGroups

  has_many :EventProgramTypes, dependent: :destroy
  has_many :program_types, through: :EventProgramTypes

  geocoded_by :address
  after_validation :geocode

  def self.search(term)
    if term
      where('title LIKE ?', "%#{term}%").order('title ASC')
    else
      order('title ASC')
    end
  end
end
