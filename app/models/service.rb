class Service < ApplicationRecord

  mount_uploader :image, ImageUploader

  scope :service_type, -> service_type_id { where(:service_type_id => service_type_id)}
  scope :category, -> category_id { self.includes(:category).where(:category => {:id => category_id}) if self.present? }
  scope :search, -> term {
    if self.has_attribute?(:service_type_id)
      joins(:organization).where('organizations.name ILIKE (?) OR service_description ILIKE (?)', "%#{term}%", "%#{term}%").order('description ASC')
  end
}

  belongs_to :service_type
  belongs_to :organization
  belongs_to :category

  validates :service_description, presence: { message: 'must be provided'}, uniqueness: true


end
