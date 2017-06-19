class Organization < ApplicationRecord

  has_many :programs,  dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :resources, dependent: :destroy

  has_many :OrganizationTaggings, dependent: :destroy
  has_many :tags, through: :OrganizationTaggings

  has_many :OrganizationAgeGroups, dependent: :destroy
  has_many :age_groups, through: :OrganizationAgeGroups

  has_many :OrganizationProgramTypes, dependent: :destroy
  has_many :program_types, through: :OrganizationProgramTypes



  # validates :description, {presence: {message: "must be provided"}}
  validates :name, presence: { message: 'must be provided'}, uniqueness: true
  #
  # validates :phone,   :presence => {:message => 'Only positive number without spaces are allowed'},
  #                    :numericality => true,
  #                    :length => { :minimum => 10, :maximum => 15 }




end
