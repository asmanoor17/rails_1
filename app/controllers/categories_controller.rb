class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  def index
    @categories = Category.all
    
    @total_articles_per_category = {}

    @categories.each do |category|
      @total_articles_per_category[category.name] = category.total_articles
    end
  end

  def show
  end
  def edit
  end
  def new
      @category = Category.new
  end
  def create
      @category = Category.new(category_params)
      if @category.save
      redirect_to @category, notice: 'Category was created.'
      else
      render :new
  end
end
  def update
      if @category.update(category_params)
          redirect_to @category, notice: 'Category was updated.'
      else
          render :edit
  end
end
  def destroy
      @category.destroy
      redirect_to categories_path, notice: 'Category was deleted.'
      end
  private
  def set_category
  @category = Category.find(params[:id])
  end
  def category_params
  params.require(:category).permit(:name, :description)
  end
end






