class RemoveAgeGroupColumnFromPrograms < ActiveRecord::Migration[5.1]
  def change
    remove_column :programs, :age_group_id, :integer
  end
end
