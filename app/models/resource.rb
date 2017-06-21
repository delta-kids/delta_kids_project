class Resource < ApplicationRecord
  # belongs_to :organization

  has_many :ResourceTaggings, dependent: :destroy
  has_many :tags, through: :ResourceTaggings

  has_many :ResourceTopics, dependent: :destroy
  has_many :topics, through: :ResourceTopics

  has_many :ResourceAgeGroups, dependent: :destroy
  has_many :age_groups, through: :ResourceAgeGroups
end
