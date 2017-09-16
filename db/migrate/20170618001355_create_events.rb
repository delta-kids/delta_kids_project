class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.datetime :start_time
      t.datetime :end_time
      t.string :event_repeat
      t.string :event_location
      t.text :address
      t.string :cost
      t.string :registration
      t.text :description
      t.string :more_info
      t.string :contact_name
      t.string :contact_email

      t.timestamps
    end
  end
end
