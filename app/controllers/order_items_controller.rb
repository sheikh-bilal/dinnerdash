# frozen_string_literal: true

# class orderitemscontroller
class OrderItemsController < ApplicationController
  include OrderItemsHelper
  def create
    @order = Order.new
    authorize @order
    @order.total = current_cart.subtotal
    @order.user_id = current_user.id

    if @order.save
      copydata(@order)
      session[:cart_id] = nil
      current_cart.destroy
      redirect_to orders_path
    else
      render items_path
    end
  end

  private

  def order_params
    params.require(:order_item).permit(:item_id, :quantity)
  end
end
