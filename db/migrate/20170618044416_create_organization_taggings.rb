class CreateOrganizationTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :organization_taggings do |t|
      t.references :organization, foreign_key: true, index: true
      t.references :tag, foreign_key: true, index: true

      t.timestamps
    end
  end
end
