class CategoriesController < ApplicationController
    # before_action :set_category, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :create]
    # def index
    #   @categories = Category.all
    # end
    def index
        @categories = Category.includes(:articles)
    end

    def new
        @category = Category.new
      end
    
      def create
        @category = Category.new(category_params)
    
        if @category.save
          redirect_to @category, notice: 'Category was successfully created.'
        else
          render :new
        end
      end
  
    # def show
    #   # Display category details and associated articles
    #   @articles = @category.articles
    # end
    def show
        @category = Category.find(params[:id])
        @article = @category.articles.find(params[:article_id])
      end
   
    private
  
    def set_category
      @category = Category.find(params[:id])
    end
    def category_params
        params.require(:category).permit(:name, :description)
    end
end
