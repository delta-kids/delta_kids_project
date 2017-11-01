class CreateWhatsNewItems < ActiveRecord::Migration[5.1]
  def change
    create_table :whats_new_items do |t|
      t.string :title
      t.string :description
      t.string :address
      t.string :phone
      t.string :email
      t.string :website_url
      t.string :image

      t.timestamps
    end
  end
end
