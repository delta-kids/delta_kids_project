class AddResourceTypeToResources < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :resource_type, :string
  end
end
