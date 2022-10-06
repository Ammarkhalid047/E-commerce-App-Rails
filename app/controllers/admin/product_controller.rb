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
      @categories = params[:product][:category]
      @subcategory = params[:product][:category
      new_array = @categories.reject {|x| x == "0"}
      new_array.each do |x|
        @product_category = ProductCategory.new(product_id: @product.id ,category_id: x)
        @product_category.save
      end
      redirect_to admin_create_product_path 
  end


  private
  
  def product_params
    params.require(:product).permit(:name, :description, {images:[]}, :price, :category, :quantity, :stock)
  end
end
