class Item < ApplicationRecord
  has_many :item_categories
  has_many :categories, through: :item_categories
  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :desc, presence: true, length: { minimum: 10, maximum: 150 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates_uniqueness_of :title
  mount_uploader :image, AvatarUploader
  serialize :category_ids
  validate :must_have_one_item

  private
  def must_have_one_item
  errors.add(:base, 'You must select at least one item') if self.category_ids.all?{|item| item.blank? }
  end
end
