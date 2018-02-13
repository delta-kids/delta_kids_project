class Resource < ApplicationRecord
  after_update :send_approved_resource_email, :if => :approved_changed?

  def send_approved_resource_email
    PendingResourceMailer.approved_resource_email(self).deliver!
  end

  scope :resource_location, -> resource_location { where(:resource_location => resource_location) }
  scope :resource_type, -> resource_type { where(:resource_type => resource_type) }
  scope :approved, -> approved { where(:approved => true) }
  scope :resource_topic, -> topic_id { Resource.includes(:topics).where(:topics => {:id => topic_id})}
  scope :resource_age_group, -> age_id { Resource.includes(:age_groups).where(:age_groups => {:id => age_id})}


  mount_uploader :resource_file, ImageUploader

  has_many :ResourceTaggings, dependent: :destroy
  has_many :tags, through: :ResourceTaggings

  has_many :ResourceTopics, dependent: :destroy
  has_many :topics, through: :ResourceTopics

  has_many :ResourceAgeGroups, dependent: :destroy
  has_many :age_groups, through: :ResourceAgeGroups

  belongs_to :user, optional: true

  def self.search(term)
    if term
      joins(:tags).where('tags.name ILIKE (?) OR resource_name ILIKE (?) OR description ILIKE (?)', "%#{term}%", "%#{term}%", "%#{term}%").order('resource_name ASC')
    else
      order('resource_name ASC')
    end
  end

end
