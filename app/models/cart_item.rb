class CartItem < ApplicationRecord
  include CartItemsHelper
  belongs_to :cart
  belongs_to :item

  before_save :set_unit_price
  before_save :set_total

  private

  def set_unit_price
    self[:unit_price] = unit_price
  end

  def set_total
    self[:total] = total
  end
end
