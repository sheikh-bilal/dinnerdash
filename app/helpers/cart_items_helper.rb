# frozen_string_literal: true

# create helper for cartitems
module CartItemsHelper
  def unit_price
    if persisted?
      self[:unit_price]
    else
      item.price
    end
  end

  def total
    unit_price * quantity
  end

  def find_item(cart_item, cart)
    cart_item = cart.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if cart_item != nil
      cart_item.quantity += (params[:cart_item][:quantity]).to_i
      cart_item.save
    else
      cart_item = cart.cart_items.new(cart_params)
    end
  end
end
