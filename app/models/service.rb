class Service < ApplicationRecord
  belongs_to :service_type
  belongs_to :organization
  belongs_to :category

  validates :description, presence: { message: 'must be provided'}, uniqueness: true
end
