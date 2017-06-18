class Event < ApplicationRecord
  belongs_to :organization

  has_many :EventTaggings, dependent: :destroy
  has_many :tags, through: :EventTaggings

  has_many :EventAgeGroups, dependent: :destroy
  has_many :ageGroups, through: :EventAgeGroups
end
