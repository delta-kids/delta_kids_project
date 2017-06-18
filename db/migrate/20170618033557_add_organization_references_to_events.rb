class AddOrganizationReferencesToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :organization, foreign_key: true, index: true
  end
end
