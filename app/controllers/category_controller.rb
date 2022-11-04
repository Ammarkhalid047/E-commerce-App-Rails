class CategoryController < ApplicationController

    def show
        @products = Product.product_by_category(params[:id])
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