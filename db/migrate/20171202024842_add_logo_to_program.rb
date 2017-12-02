class AddLogoToProgram < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :logo, :string
  end
end
