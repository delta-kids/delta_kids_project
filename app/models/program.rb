class Program < ApplicationRecord
  belongs_to :age_group
  belongs_to :program_type
  belongs_to :organization

  validates :description, { presence: {message: "must be provided"}}
  validates :registration, inclusion: { in: ['registered', 'drop in'] }
  validates :cost, inclusion: { in: ['free', 'paid'] }
  
end
