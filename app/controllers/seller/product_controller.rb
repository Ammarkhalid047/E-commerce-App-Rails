class Seller::ProductController < ApplicationController

  load_and_authorize_resource
  
    def index
      @shop = current_user.shop
      @products = @shop.products.all
    end
    def new
      @categories = Category.all
      @subcategories = SubCategory.all
    end
  
    def create
        @shop = current_user.shop
        @product = @shop.products.new(product_params)
        if @product.save
          @product_category = ProductCategory.new(product_id: @product.id ,:sub_category_id=> params[:product][:sub_categories])
          @product_category.save
          redirect_to new_seller_product_path
          flash.notice = "Product Added Successfully!"
        else 
          redirect_to new_seller_product_path
          flash.alert = "Product Added Successfully!"
        end
    end

    def edit
      @product = Product.find(params[:id])
      @categories = Category.all
      @subcategories = SubCategory.all
    end

    def update
      @product = Product.update(product_params)
    end
  
    private
    
    def product_params
      params.require(:product).permit(:name, :description, {images:[]}, :price, :quantity, :stock)
    end
  end
  