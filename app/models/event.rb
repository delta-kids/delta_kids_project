class Event < ApplicationRecord
  # belongs_to :organization, :class, optional: true

  # scope :by_date, -> (start_date: Date.current() - 9999.years, end_date: Date.current() + 9999.years) { where(start_date: start_date..end_date, end_date: start_date..end_date) }
  scope :by_start_date, -> start_date { self.where(['start_date >= ?', start_date]) if self.present?  }
  scope :by_end_date, -> end_date { self.where(['start_date <= ?', end_date]) if self.present? }

  scope :event_location, -> event_location { self.where(:event_location => event_location) if self.present? }
  scope :registration, -> registration { self.where(:registration => registration) if self.present? }
  scope :cost, -> cost { self.where(:cost => cost) if self.present? }
  scope :program_type, -> program_type_id { self.includes(:program_types).where(:program_types => {:id => program_type_id}) if self.present?}
  scope :age_group, -> age_id { self.includes(:age_groups).where(:age_groups => {:id => age_id}) if self.present? }

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
      where('title ILIKE (?) OR description ILIKE (?)', "%#{term}%", "%#{term}%").order('title ASC')
    else
      order('title ASC')
    end
  end
end
