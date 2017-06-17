class Program < ApplicationRecord
  belongs_to :age_group
  belongs_to :program_type
  belongs_to :organization
end
