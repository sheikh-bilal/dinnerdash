class OrdersController < ApplicationController
  include OrdersHelper
  before_action :set_order, only: [:edit, :show, :update]
  before_action :set_authorize, only: [:edit, :show, :update]
  def index

    if user_signed_in? && current_user.admin?
      @orders = Order.all
    elsif user_signed_in? && !current_user.admin?
      @orders = current_user.orders
    else
      flash[:alert] = "You are not authorized to access Orders"
      redirect_to root_path
    end
  end

  def edit
  end

  def show
  end

  def update
    if @order.update_attribute(:status, params[:order][:status])
      flash[:notice] = "Updated successfully"
      redirect_to orders_path
    else
      flash[:alert] = "Updated Error!!"
      render 'edit'
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_authorize
    authorize @order
  end
end
