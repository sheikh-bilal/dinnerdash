# frozen_string_literal: true

# class categories controller
class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update show destroy]
  before_action :set_authorize, only: %i[edit destroy]

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def index
    @categories = Category.page(params[:page]).per(3)
    authorize @categories
  end

  def show
    @items = if user_signed_in?
               @category.items.page(params[:page]).per(6)
             else
               @category.items.where(status: 'active').page(params[:page]).per(6)
             end
    @cart_item = current_cart.cart_items.new
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def set_authorize
    authorize @category
  end
end
