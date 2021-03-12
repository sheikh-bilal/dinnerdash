# frozen_string_literal: true

# items controller for managing action on food items
class ItemsController < ApplicationController
  def index
    @items = Item.all
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
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def destroy
    @article = Item.find(params[:id])
    @article.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :desc)
  end
end
