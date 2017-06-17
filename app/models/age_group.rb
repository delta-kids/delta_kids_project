class AgeGroup < ApplicationRecord


  validates :age, presence: { message: 'group must be provided'}, uniqueness: true

  has_many :organizations, dependent: :destroy

end
