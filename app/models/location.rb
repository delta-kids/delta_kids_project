class Location < ApplicationRecord
  has_many :event_locations, dependent: :destroy
  has_many :events, through: :event_locations
end
