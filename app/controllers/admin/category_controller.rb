class Admin::CategoryController < ApplicationController

    def new
        @categories = Category.all
    end

    def index
        @categories = Category.all
    end

    def destroy
        @category = Category.friendly.find(params[:id])
        @category.destroy
        redirect_to admin_category_index_path
    end

    def create
        @category = Category.new(category_params)
        @category.save
        new_admin_category_path
    end

    private
  
    def category_params
      params.require(:category).permit(:title)
    end
    
end
