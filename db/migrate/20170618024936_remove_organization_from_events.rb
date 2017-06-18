class RemoveOrganizationFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :organization_id, :integer
  end
end
