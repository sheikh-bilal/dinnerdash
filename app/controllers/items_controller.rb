# frozen_string_literal: true

# items controller for managing action on food items
class ItemsController < ApplicationController
  before_action :set_item, only: %i[edit show update destroy]
  before_action :authorize_item, only: %i[edit destroy]

  def index
    @items = if user_signed_in?
               Item.page(params[:page]).per(6)
             else
               Item.where(status: 'active').page(params[:page]).per(6)
             end

    @cart_item = current_cart.cart_items.new
  end

  def new
    @item = Item.new
    authorize_item
  end

  def create
    @item = Item.new(item_params)
    authorize_item
    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def show; end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def edit; end

  def destroy
    if@item.destroy
      flash[:alert] = 'Item is destroyed.!!'
        redirect_to items_path
    else
      flash[:alert] = 'Error: item not destroyed..!!'
      redirect_to items_path
    end
  end

  def search
    @items = Item.where('title LIKE ?', "%#{params[:find_item].capitalize}%").page(params[:page]).per(6)
    @cart_item = current_cart.cart_items.new
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :image, :desc, :status, category_ids: [])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def authorize_item
    authorize @item
  end
end
