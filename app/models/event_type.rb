class EventType < ApplicationRecord
  validates :name, presence: { message: 'must be provided'}, uniqueness: true

  has_many :events, dependent: :destroy
end
