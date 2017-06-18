class EventAgeGroup < ApplicationRecord
  belongs_to :event
  belongs_to :age_group
end
