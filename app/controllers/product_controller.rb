class ProductController < ApplicationController

    def show
        @product = Product.find(params[:id])
        @reviews = @product.reviews
    end

    def search
        name = "%#{params[:product][:name]}%"
        @products = Product.searched(name)
    end
end