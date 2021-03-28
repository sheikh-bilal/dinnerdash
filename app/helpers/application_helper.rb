# frozen_string_literal: true

# current cart function
module ApplicationHelper
  def current_cart
    if !session[:cart_id].nil?
      Cart.find(session[:cart_id])
    else
      Cart.new
    end
  end

  def is_retire(record)
    return true if record.status == 'retire'
  end
end
