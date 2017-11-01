class Program < ApplicationRecord


  scope :program_type, -> program_type_id { where(:program_type_id => program_type_id) }
  scope :age_group, -> age_id { includes(:age_groups).where(:age_groups => {:id => age_id}) }
  scope :cost, -> cost { where(:cost => cost) }
  scope :search, -> term {
    if self.has_attribute?(:event_type_id)
      where('title ILIKE (?) OR description ILIKE (?)', "%#{term}%", "%#{term}%").order('title ASC')
    elsif self.has_attribute?(:program_type_id)
      where('description ILIKE (?)', "%#{term}%").order('description ASC')
    elsif self.has_attribute?(:service_type_id)
      where('description ILIKE (?)', "%#{term}%").order('description ASC')
  end
}

  belongs_to :program_type
  belongs_to :organization

  has_many :ProgramAgeGroups, dependent: :destroy
  has_many :age_groups, through: :ProgramAgeGroups

  validates :description, { presence: {message: "must be provided"}}
  validates :registration, inclusion: { in: ['Registered', 'Drop In'] }
  validates :cost, inclusion: { in: ['Free', 'Paid'] }


end
