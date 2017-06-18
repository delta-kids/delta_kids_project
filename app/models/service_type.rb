class ServiceType < ApplicationRecord
  has_many :services, dependent: :destroy

  validates :name, { presence: { message: "must be provided" } }

end
