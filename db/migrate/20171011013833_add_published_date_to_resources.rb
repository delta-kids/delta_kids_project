class AddPublishedDateToResources < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :published_date, :string
    add_column :resources, :string, :string
  end
end
