class AddLogoToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :logo, :string
  end
end
