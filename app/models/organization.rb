class Organization < ApplicationRecord
  belongs_to :age_group

  has_many :programs,  dependent: :destroy



  validates :description, {presence: {message: "must be provided"}}
  validates :name, presence: { message: 'must be provided'}, uniqueness: true

  validates :phone,   :presence => {:message => 'Only positive number without spaces are allowed'},
                     :numericality => true,
                     :length => { :minimum => 10, :maximum => 15 }




end
