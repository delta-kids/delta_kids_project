class AddImageToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :image, :string
  end
end
