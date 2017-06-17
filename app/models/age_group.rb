class AgeGroup < ApplicationRecord
  has_many :organizations, dependent: :destroy
end
