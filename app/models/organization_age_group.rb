class OrganizationAgeGroup < ApplicationRecord
  belongs_to :organization
  belongs_to :age_group
end
