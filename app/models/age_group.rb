class AgeGroup < ApplicationRecord
  validates :age, presence: { message: 'group must be provided'}, uniqueness: true

  has_many :EventAgeGroups, dependent: :destroy
  has_many :events, through: :EventAgeGroups

  has_many :ProgramAgeGroups, dependent: :destroy
  has_many :programs, through: :ProgramAgeGroups

  has_many :OrganizationAgeGroups, dependent: :destroy
  has_many :organizations, through: :OrganizationAgeGroups

  has_many :ResourceAgeGroups, dependent: :destroy
  has_many :resources, through: :ResourceAgeGroups
end
