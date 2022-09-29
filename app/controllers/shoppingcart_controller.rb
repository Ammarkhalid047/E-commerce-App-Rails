class ShoppingcartController < ApplicationController
    def show
    @cart = current_user.shoppingcart.cart_items
    end
end
