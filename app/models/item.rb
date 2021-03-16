class Item < ApplicationRecord
  has_many :item_categories
  has_many :categories, through: :item_categories
  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :desc, presence: true, length: { minimum: 10, maximum: 150 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates_uniqueness_of :title
  mount_uploader :image, AvatarUploader
end
