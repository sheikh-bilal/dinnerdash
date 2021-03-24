# frozen_string_literal: true

# items controller for managing action on food items
class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :set_authorize, only: [:new, :create, :edit, :destroy]

  def index
    @items = Item.all
    @cart_item = current_cart.cart_items.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render "edit"
    end
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :image, :desc, category_ids: [])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_authorize
    authorize @item
  end
end
