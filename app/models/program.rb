class Program < ApplicationRecord


  scope :program_type, -> program_type_id { self.includes(:program_types).where(:program_types => {:id => program_type_id}) if self.present? }
  scope :age_group, -> age_id { self.includes(:age_groups).where(:age_groups => {:id => age_id}) if self.present? }

  belongs_to :program_type
  belongs_to :organization

  has_many :ProgramAgeGroups, dependent: :destroy
  has_many :age_groups, through: :ProgramAgeGroups



  validates :description, { presence: {message: "must be provided"}}
  validates :registration, inclusion: { in: ['Registered', 'Drop In'] }
  validates :cost, inclusion: { in: ['Free', 'Paid'] }

  def self.search(term)
    if term
      where('description ILIKE (?)', "%#{term}%").order('description ASC')
    else
      order('description ASC')
    end
  end

end
