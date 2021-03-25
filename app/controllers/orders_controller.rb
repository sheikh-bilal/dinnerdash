class OrdersController < ApplicationController

  before_action :set_order, only: [:edit, :show]
  def index
    if user_signed_in? && current_user.admin?
      @orders = Order.all
    else
      @orders = current_user.orders
    end
  end

  def edit
  end

  def show
    authorize @order
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
