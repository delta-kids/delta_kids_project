class ChangeProgramColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :programs, :description, :program_description
  end
end
