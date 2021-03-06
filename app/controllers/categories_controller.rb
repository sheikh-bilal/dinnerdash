# frozen_string_literal: true

# class categories controller
class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update show destroy]
  before_action :authorize_category, only: %i[edit destroy]

  def new
    @category = Category.new
    authorize_category
  end

  def create
    @category = Category.new(category_params)
    authorize_category
    if @category.save
      redirect_to categories_path
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
    if @category.destroy
      flash[:alert] = 'Category is destroyed.!!'
      redirect_to categories_path
    else
      flash[:alert] = 'Error: category not destroyed..!!'
      redirect_to categories_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def authorize_category
    authorize @category
  end
end
