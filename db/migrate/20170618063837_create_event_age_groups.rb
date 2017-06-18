class CreateEventAgeGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :event_age_groups do |t|
      t.references :event, foreign_key: true, index: true
      t.references :age_group, foreign_key: true, index: true

      t.timestamps
    end
  end
end
