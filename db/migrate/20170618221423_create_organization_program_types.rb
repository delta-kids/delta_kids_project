class CreateOrganizationProgramTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_program_types do |t|
      t.references :organization, foreign_key: true, index: true
      t.references :program_type, foreign_key: true, index: true

      t.timestamps
    end
  end
end
