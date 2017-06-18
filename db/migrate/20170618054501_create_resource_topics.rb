class CreateResourceTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_topics do |t|
      t.references :resource, foreign_key: true, index: true
      t.references :topic, foreign_key: true, index: true

      t.timestamps
    end
  end
end
