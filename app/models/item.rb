class Item < ApplicationRecord
  has_many :item_categories
  has_many :categories, through: :item_categories
  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :desc, presence: true, length: { minimum: 10, maximum: 150 }
  mount_uploader :image, AvatarUploader
end
