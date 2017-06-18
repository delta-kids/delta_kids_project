class CreateResourceTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_taggings do |t|
      t.references :resource, foreign_key: true, index: true
      t.references :tag, foreign_key: true, index: true

      t.timestamps
    end
  end
end
