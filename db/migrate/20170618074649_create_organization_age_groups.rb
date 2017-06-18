class CreateOrganizationAgeGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_age_groups do |t|
      t.references :organization, foreign_key: true, index: true
      t.references :age_group, foreign_key: true, index: true

      t.timestamps
    end
  end
end
