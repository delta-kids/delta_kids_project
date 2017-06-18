class EventProgramType < ApplicationRecord
  belongs_to :event
  belongs_to :program_type
end
