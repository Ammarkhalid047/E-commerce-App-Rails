class HomeController < ApplicationController
  
  
  def index
    if user_signed_in?
    @products = []
    recommended_categories = SubCategory.recommended_categories(current_user)
    other_products = Product.recommended_products(recommended_categories)
    recommended_categories.each do |subcategory|
      subcategory.products.each do |product|
        @products.push(product)
      end
    end
    other_products.each do |other|
      @products.push(other)
    end
    else
      @products = Product.all
      @products =  @products.sort_by { |product| -product.likes.count }
    end
  end


  def show
    @products = Product.product_by_category(params[:id])
    @subcategories = Category.find(params[:id]).sub_categories
    @cart = CartItem.all
  end


end
