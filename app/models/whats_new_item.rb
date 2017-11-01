class WhatsNewItem < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :title, { presence: {message: "must be provided"}}
  validates :description, { presence: {message: "must be provided"}}
end
