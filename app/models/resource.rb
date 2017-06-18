class Resource < ApplicationRecord
  belongs_to :organization

  has_many :ResourceTaggings, dependent: :destroy
  has_many :tags, through: :ResourceTaggings
end
