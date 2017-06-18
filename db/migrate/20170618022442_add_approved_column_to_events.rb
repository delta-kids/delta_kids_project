class AddApprovedColumnToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :approved, :boolean
  end
end
