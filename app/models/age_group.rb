class AgeGroup < ApplicationRecord
  validates :age, presence: { message: 'group must be provided'}, uniqueness: true

  has_many :EventAgeGroups, dependent: :destroy
  has_many :events, through: :EventAgeGroups
end
