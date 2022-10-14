class CategoryController < ApplicationController

    def show
        @products = Product.joins(:sub_categories).where(:sub_categories => {:category_id => params[:id]})
        @subcategories = Category.find(params[:id]).sub_categories
        @cart = CartItem.all
    end

    def get_products
        @products = SubCategory.find(params[:id]).products
        respond_to do |format|
          format.json { head :no_content }
          format.js   { render :layout => false }
        end
    end
end