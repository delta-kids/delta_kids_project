class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :resources, :name, :resource_name
  end
end
