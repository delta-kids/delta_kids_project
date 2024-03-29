class Program < ApplicationRecord

  mount_uploader :image, ImageUploader

  scope :registration, -> registration { where(:registration => registration) }
  scope :program_type, -> program_type_id { where(:program_type_id => program_type_id) }
  scope :age_group, -> age_id { Program.includes(:age_groups).where(:age_groups => {:id => age_id}) }
  scope :cost, -> cost { where(:cost => cost) }
  scope :search, -> term {
    if self.has_attribute?(:program_type_id)
      joins(:organization).where('organizations.name ILIKE (?) OR program_description ILIKE (?) OR organizations.address ILIKE (?)', "%#{term}%", "%#{term}%", "%#{term}%").order('description ASC')
  end

}

  belongs_to :program_type
  belongs_to :organization

  has_many :ProgramAgeGroups, dependent: :destroy
  has_many :age_groups, through: :ProgramAgeGroups

  validates :program_description, { presence: {message: "must be provided"}}
  validates :registration, inclusion: { in: ['Registered', 'Drop In'] }
  validates :cost, inclusion: { in: ['Free', 'Paid'] }

end
