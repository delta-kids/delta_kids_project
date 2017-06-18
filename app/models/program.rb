class Program < ApplicationRecord
  belongs_to :program_type
  belongs_to :organization

  has_many :ProgramAgeGroups, dependent: :destroy
  has_many :age_groups, through: :ProgramAgeGroups



  validates :description, { presence: {message: "must be provided"}}
  validates :registration, inclusion: { in: ['Registered', 'Drop In'] }
  validates :cost, inclusion: { in: ['Free', 'Paid'] }


end
