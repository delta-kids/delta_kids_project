class OrganizationProgramType < ApplicationRecord
  belongs_to :organization
  belongs_to :program_type
end
