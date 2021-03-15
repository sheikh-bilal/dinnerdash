class Item < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :desc, presence: true, length: { minimum: 10, maximum: 150 }
  mount_uploader :image, AvatarUploader
end
