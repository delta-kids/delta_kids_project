class Resource < ApplicationRecord
  # belongs_to :organization
  scope :by_date, -> start_date, end_date { where("start_date = ? AND end_date = ?", start_date, end_date) }
  scope :resource_location, -> resource_location { where(:resource_location => resource_location) }

  mount_uploader :resource_file, ImageUploader

  has_many :ResourceTaggings, dependent: :destroy
  has_many :tags, through: :ResourceTaggings

  has_many :ResourceTopics, dependent: :destroy
  has_many :topics, through: :ResourceTopics

  has_many :ResourceAgeGroups, dependent: :destroy
  has_many :age_groups, through: :ResourceAgeGroups

  def self.search(term)
    if term
      where('name ILIKE ?', "%#{term}%").order('name ASC')
    else
      order('name ASC')
    end
  end

end
