class ProductController < ApplicationController

    def show
        @product = Product.find(params[:id])
        @reviews = @product.reviews
    end


end