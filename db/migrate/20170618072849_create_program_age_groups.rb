class CreateProgramAgeGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :program_age_groups do |t|
      t.references :program, foreign_key: true, index: true
      t.references :age_group, foreign_key: true, index: true

      t.timestamps
    end
  end
end
