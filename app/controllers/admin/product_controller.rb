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
      if @product.save
        @product_category = ProductCategory.new(product_id: @product.id ,:sub_category_id=> params[:product][:subcategory])
        @product_category.save
        redirect_to new_admin_product_path
        flash.notice = "Product Added Successfully!"
      else 
        redirect_to new_admin_product_path
        flash.alert = "Product Added Successfully!"
      end
  end


  private
  
  def product_params
    params.require(:product).permit(:name, :description, {images:[]}, :price, :quantity, :stock)
  end
end
