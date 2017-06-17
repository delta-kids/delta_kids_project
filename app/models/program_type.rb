class ProgramType < ApplicationRecord

  validates :name, presence: { message: 'must be provided'}, uniqueness: true

  has_many :programs, dependent: :destroy

end
