class ProgramType < ApplicationRecord
  validates :name, presence: { message: 'must be provided'}, uniqueness: true
end
