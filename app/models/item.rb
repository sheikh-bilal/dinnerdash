class Item < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :desc, presence: true, length: { minimum: 10, maximum: 70 }
end
