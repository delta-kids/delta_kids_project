class Tag < ApplicationRecord
  has_many :OrganizationTaggings, dependent: :destroy
  has_many :organizations, through: :OrganizationTaggings

  has_many :ResourceTaggings, dependent: :destroy
  has_many :resources, through: :ResourceTaggings

  has_many :EventTaggings, dependent: :destroy
  has_many :events, through: :EventTaggings

end
