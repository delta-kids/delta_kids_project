class CreateAgeGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :age_groups do |t|
      t.string :age

      t.timestamps
    end
  end
end
