class HomeController < ApplicationController
  def index
    @products = Product.all
  end
  def show
    @products = Category.friendly.find(params[:id]).products
    @cart = CartItem.all
  end
end
