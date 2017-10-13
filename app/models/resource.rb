class Resource < ApplicationRecord
  scope :by_date, -> start_date, end_date { where("start_date = ? AND end_date = ?", start_date, end_date) }
  scope :resource_location, -> resource_location { where(:resource_location => resource_location) }
  scope :resource_topic, -> topic_id { Resource.includes(:topics).where(:topics => {:id => topic_id})}
  scope :resource_age_group, -> age_id { Resource.includes(:age_groups).where(:age_groups => {:id => age_id})}








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
