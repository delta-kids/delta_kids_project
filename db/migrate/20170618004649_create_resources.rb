class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.boolean :feature
      t.date :feature_start_date
      t.date :feature_end_date
      t.time :feature_start_time
      t.time :feature_end_time
      t.string :resource_location
      t.text :description
      t.string :contact_name
      t.string :contact_email

      t.timestamps
    end
  end
end
