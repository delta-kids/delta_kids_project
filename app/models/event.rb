class Event < ApplicationRecord
  belongs_to :organization

  has_many :EventTaggings, dependent: :destroy
  has_many :tags, through: :EventTaggings
end
