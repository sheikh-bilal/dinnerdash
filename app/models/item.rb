# frozen_string_literal: true

# Implement items model
class Item < ApplicationRecord
  has_many :item_categories
  has_many :cart_items
  has_many :categories, through: :item_categories

  validates :title, presence: true, length: { minimum: 3, maximum: 30 }, uniqueness: true
  validates :desc, presence: true, length: { minimum: 10, maximum: 150 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validate :must_have_one_item

  mount_uploader :image, AvatarUploader

  private

  def must_have_one_item
    errors.add(:base, 'You must select at least one category') if category_ids.all?(&:blank?)
  end
end
