class Organization < ApplicationRecord
  belongs_to :age_group
  has_many :programs,  dependent: :destroy
end
