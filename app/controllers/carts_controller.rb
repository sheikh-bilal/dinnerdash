# frozen_string_literal: true

# create cart controller
class CartsController < ApplicationController
  def destroy
    @cart = current_cart
    session[:cart_id] = nil
    @cart.destroy
    redirect_to items_path
  end
end
