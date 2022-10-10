class Admin::ProductController < ApplicationController
  
  def index
    @products = Product.all
  end
  def new
    @categories = Category.all
    @subcategories = SubCategory.all
  end

  def create
      @product = Product.new(product_params)
      @product.save
      puts subcategory_id: params[:product][:subcategory]
      
        @product_category = ProductCategory.new(product_id: @product.id ,:sub_category_id=> params[:product][:subcategory])
        @product_category.save
      
  end


  private
  
  def product_params
    params.require(:product).permit(:name, :description, {images:[]}, :price, :quantity, :stock)
  end
end
