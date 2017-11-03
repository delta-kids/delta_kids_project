class AddImageToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :image, :string
  end
end
