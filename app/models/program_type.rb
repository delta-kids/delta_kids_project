class ProgramType < ApplicationRecord

  validates :name, presence: { message: 'must be provided'}, uniqueness: true

  has_many :programs, dependent: :destroy

  has_many :EventProgramTypes, dependent: :destroy
  has_many :events, through: :EventProgramTypes

  has_many :OrganizationProgramTypes, dependent: :destroy
  has_many :organizations, through: :OrganizationProgramTypes

end
