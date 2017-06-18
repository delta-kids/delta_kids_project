class AddOrganizationToResources < ActiveRecord::Migration[5.1]
  def change
    add_reference :resources, :organization, foreign_key: true, index: true
  end
end
