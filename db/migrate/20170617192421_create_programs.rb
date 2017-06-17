class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      t.text :description
      t.string :registration
      t.string :cost
      t.references :age_group, foreign_key: true
      t.references :program_type, foreign_key: true
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
