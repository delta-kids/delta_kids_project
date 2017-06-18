class ResourceTagging < ApplicationRecord
  belongs_to :resource
  belongs_to :tag
end
