class Service < ApplicationRecord

  mount_uploader :image, ImageUploader
  mount_uploader :logo, ImageUploader

  scope :service_type, -> service_type_id { where(:service_type_id => service_type_id)}
  scope :category, -> category_id { self.includes(:category).where(:category => {:id => category_id}) if self.present? }
  scope :search, -> term {
    if self.has_attribute?(:event_type_id)
      where('title ILIKE (?) OR description ILIKE (?)', "%#{term}%", "%#{term}%").order('title ASC')
    elsif self.has_attribute?(:program_type_id)
      where('description ILIKE (?)', "%#{term}%").order('description ASC')
    elsif self.has_attribute?(:service_type_id)
      where('description ILIKE (?)', "%#{term}%").order('description ASC')
  end
}

  belongs_to :service_type
  belongs_to :organization
  belongs_to :category

  validates :description, presence: { message: 'must be provided'}, uniqueness: true


end
