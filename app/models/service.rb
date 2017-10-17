class Service < ApplicationRecord

  scope :service_type, -> service_type_id { Event.includes(:service_types).where(:service_types => {:id => service_type_id})}
  scope :category, -> category_id { self.includes(:category).where(:category => {:id => category_id}) if self.present? }

  belongs_to :service_type
  belongs_to :organization
  belongs_to :category

  validates :description, presence: { message: 'must be provided'}, uniqueness: true

  def self.search(term)
    if term
      where('description ILIKE (?)', "%#{term}%").order('description ASC')
    else
      order('description ASC')
    end
  end
end
