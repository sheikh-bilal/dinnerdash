# frozen_string_literal: true

# class cartcontroller
class CartItemsController < ApplicationController
  before_action :set_cart_items, only: %i[create update destroy]

  def create
    @cart_item = @cart.cart_items.new(cart_params)
    if @cart.save
      session[:cart_id] = @cart.id
    else
      render items_path
    end
  end

  def update
    @cart_item = @cart.cart_items.find(params[:id])
    if @cart_item.update_attributes(cart_params)
      @cart_items = current_cart.cart_items
    else
      render carts_path
    end
  end

  def destroy
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    @cart_items = current_cart.cart_items
    redirect_to carts_path
  end

  private

  def cart_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

  def set_cart_items
    @cart = current_cart
  end
end
