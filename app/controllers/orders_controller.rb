class OrdersController < ApplicationController

  before_action :set_order, only: [:edit, :show]
  def index
    @orders = Order.all
  end

  def edit
  end

  def show
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
