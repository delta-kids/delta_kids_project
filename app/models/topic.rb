class Topic < ApplicationRecord
  has_many :ResourceTopics, dependent: :destroy
  has_many :resources, through: :ResourceTopics

end
