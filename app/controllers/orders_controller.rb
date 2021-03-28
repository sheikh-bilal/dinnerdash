# frozen_string_literal: true

# class orders controller
class OrdersController < ApplicationController
  include OrdersHelper
  before_action :set_order, only: %i[edit show update]
  before_action :set_authorize, only: %i[edit show update]
  def index
    if user_signed_in? && current_user.admin?
      @completedorders = Order.where(status: 'Completed')
      @pendingorders = Order.where(status: 'pending')
      @cancelorders = Order.where(status: 'Cancel')
      @paidorders = Order.where(status: 'Paid')
    elsif user_signed_in? && !current_user.admin?
      @completedorders = current_user.orders.where(status: 'Completed')
      @pendingorders = current_user.orders.where(status: 'pending')
      @cancelorders = current_user.orders.where(status: 'Cancel')
      @paidorders = current_user.orders.where(status: 'Paid')
    else
      flash[:alert] = 'You are not authorized to access Orders'
      redirect_to root_path
    end
  end

  def edit; end

  def show; end

  def update
    if @order.update_attribute(:status, params[:order][:status])
      flash[:notice] = 'Updated successfully'
      redirect_to orders_path
    else
      flash[:alert] = 'Updated Error!!'
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
