class Event < ApplicationRecord
  # belongs_to :organization, :class, optional: true
  mount_uploader :image, ImageUploader

  has_many :EventTaggings, dependent: :destroy
  has_many :tags, through: :EventTaggings

  has_many :EventAgeGroups, dependent: :destroy
  has_many :age_groups, through: :EventAgeGroups

  has_many :EventProgramTypes, dependent: :destroy
  has_many :programTypes, through: :EventProgramTypes

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
