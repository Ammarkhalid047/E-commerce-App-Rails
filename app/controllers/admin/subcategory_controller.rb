class Admin::SubcategoryController < ApplicationController


    def new

    end

    def create
        @categories = params[:subcategory][:category]
        new_array = @categories.reject {|x| x == "0"}
        new_array.each do |x|
            @category = Category.find(x)
            @subcategory = @category.sub_categories.new(subcategory_params)
            @subcategory.save
        end
        redirect_to new_admin_category_path
    end


    def show
        @category = Category.find(params[:id])
        @sub_categories = @category.sub_categories
        respond_to do |format|
            format.json { head :no_content }
            format.js   { render :layout => false }
         end
    end


    private
        def subcategory_params
            params.require(:subcategory).permit(:title)
        end
end