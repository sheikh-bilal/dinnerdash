class CategoriesController < ApplicationController

  before_action :set_category, only: [:edit, :update, :show, :destroy]

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render "new"
    end
  end

  def index
    @categories = Category.all
    authorize @categories
  end

  def show
    authorize @category
  end

  def edit
    authorize @category
  end

  def update
    if @category.update(category_params)
      redirect_to @category
    else
      render "edit"
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
end
