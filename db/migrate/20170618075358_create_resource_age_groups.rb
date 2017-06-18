class CreateResourceAgeGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_age_groups do |t|
      t.references :resource, foreign_key: true, index: true
      t.references :age_group, foreign_key: true, index: true

      t.timestamps
    end
  end
end
