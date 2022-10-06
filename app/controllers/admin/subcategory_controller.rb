class Admin::SubcategoryController < ApplicationController


    def new

    end

    def create
        @categories = params[:subcategory][:category]
        new_array = @categories.reject {|x| x == "0"}
        new_array.each do |x|
            @category = Category.find(x)
            @subcategory = @category.subcategory.new(subcategory_params)
            @subcategory.save
        end
        redirect_to admin_create_category_path
    end

    private
        def subcategory_params
            params.require(:subcategory).permit(:title)
        end
end