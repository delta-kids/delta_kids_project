class ProgramType < ApplicationRecord
  has_many :programs, dependent: :destroy
end
