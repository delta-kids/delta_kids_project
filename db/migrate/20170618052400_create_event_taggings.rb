class CreateEventTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :event_taggings do |t|
      t.references :event, foreign_key: true, index: true
      t.references :tag, foreign_key: true, index: true

      t.timestamps
    end
  end
end
