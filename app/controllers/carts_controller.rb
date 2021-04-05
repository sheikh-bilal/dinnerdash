# frozen_string_literal: true

# create cart controller
class CartsController < ApplicationController
  def index
    @cart_items = current_cart.cart_items
  end

  def destroy
    @cart = current_cart
    session[:cart_id] = nil
    if @cart.destroy
      flash[:alert] = 'Your cart is Cleared.!!'
      redirect_to items_path
    else
      flash[:alert] = 'You got an Error..!!'
      render 'index'
    end
  end
end
