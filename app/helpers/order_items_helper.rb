# frozen_string_literal: true

# class order helper
module OrderItemsHelper
  def copydata(order)
    current_cart.cart_items.each do |cart_item|
      order.order_items.create!(
        quantity: cart_item.quantity,
        item_id: cart_item.item_id,
        order_id: order.id,
        total: cart_item.total,
        unit_price: cart_item.unit_price
      )
    end
  end
end
