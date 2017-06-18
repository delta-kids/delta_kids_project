class Category < ApplicationRecord
  has_many :organizations, dependent: :nullify
  has_many :services, dependent: :nullify
end
