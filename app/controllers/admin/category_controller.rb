class Admin::CategoryController < ApplicationController

    load_and_authorize_resource

    def new
        @categories = Category.all
    end

    def index
        @categories = Category.all
    end

    def destroy
        @category = Category.friendly.find(params[:id])
        if @category.destroy
            redirect_to admin_category_index_path
            flash.notice = "Category destroyed Successfully!"
        else 
            redirect_to admin_category_index_path
            flash.alert = "Category couldn't be destroyed, there has been some issue!"
        end
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to new_admin_category_path
            flash.notice = "Category created Successfully!"
        else
            redirect_to new_admin_category_path
            flash.alert = "Category couldn't be created Successfully!"
        end
    end

    private
  
    def category_params
      params.require(:category).permit(:title)
    end
    
end
