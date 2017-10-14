class AddResourceFileToResources < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :resource_file, :string
  end
end
