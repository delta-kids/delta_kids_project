class AddOrganizationIdColumnToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :organization_id, :integer
  end
end
