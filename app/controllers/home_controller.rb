class HomeController < ApplicationController
  
  
  def index
    @products = []
    recommended_categories = SubCategory.recommended_categories(current_user)
    other_products = Product.joins(:sub_categories).where.not(sub_categories: {:id => recommended_categories})
    recommended_categories.each do |subcategory|
      subcategory.products.each do |product|
        @products.push(product)
      end
    end
    other_products.each do |other|
      @products.push(other)
    end
  end


  def show
    @products = Product.joins(:sub_categories).where(:sub_categories => {:category_id => params[:id]})
    @subcategories = Category.find(params[:id]).sub_categories
    @cart = CartItem.all
  end
  
  
  def view_product
    @product = Product.find(params[:id])
    @reviews = @product.reviews
  end
  
  
  def get_products
    @products = SubCategory.find(params[:id]).products
    respond_to do |format|
      format.json { head :no_content }
      format.js   { render :layout => false }
   end
  end


end
