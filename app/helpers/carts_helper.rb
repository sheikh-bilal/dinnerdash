# frozen_string_literal: true

# class carthelper
module CartsHelper
  def subtotal
    cart_items.collect { |cart_item| cart_item.valid? ? cart_item.unit_price * cart_item.quantity : 0 }.sum
  end
end
