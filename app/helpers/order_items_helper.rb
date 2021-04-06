# frozen_string_literal: true

# class order helper
module OrderItemsHelper
  def copydata(order)
    current_cart.cart_items.each do |cart_item|
      @check = order.order_items.create(
        quantity: cart_item.quantity,
        item_id: cart_item.item_id,
        order_id: order.id,
        total: cart_item.total,
        unit_price: cart_item.unit_price
      )
      if @check.save
        flash[:notice] = 'Order saved successfully'
      else
        flash[:alert] = "Error: Order not saved"
        redirect_to carts_path
      end
    end
  end
end
