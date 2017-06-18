class OrganizationTagging < ApplicationRecord
  belongs_to :organization
  belongs_to :tag
end
