class ResourceAgeGroup < ApplicationRecord
  belongs_to :resource
  belongs_to :age_group
end
