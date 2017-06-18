class RemoveColumnAgeGroupIdFromOrganization < ActiveRecord::Migration[5.1]
  def change
    remove_column :organizations, :age_group_id, :integer
  end
end
