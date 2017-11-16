class AddUserIdToResources < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :user_id, :integer
  end
end
