class ChangeServiceColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :services, :description, :service_description
  end
end
