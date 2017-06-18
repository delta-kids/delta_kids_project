class Program < ApplicationRecord
  belongs_to :age_group
  belongs_to :program_type
  belongs_to :organization



  validates :description, { presence: {message: "must be provided"}}
  validates :registration, inclusion: { in: ['Registered', 'Drop In'] }
  validates :cost, inclusion: { in: ['Free', 'Paid'] }


end
