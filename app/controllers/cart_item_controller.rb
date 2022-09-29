class CartItemController < ApplicationController
    def show
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        redirect_to shoppingcart_path
    end
    
    def create
        
        selected_product = Product.find(params[:product_id])
        current_cart = current_user.shoppingcart
        
        if current_cart.products.include?(selected_product)
            
            @cart_item = current_cart.cart_items.find_by(:product_id => selected_product.id)
            @cart_item.quantity += 1
        
        else
           
            @cart_item = CartItem.new
            @cart_item.shoppingcart = current_cart
            @cart_item.product = selected_product
            @cart_item.quantity = 1
        
        end
        @cart_item.save
    
    end


    def add_quantity
    end

    def reduce_quantity
    end

    def destroy
        @cart_item = cartItem.find(params[:id])
        @cart_item.destroy
        redirect_to shoppingcart_path
    end
    
end
private
  def line_item_params
    params.require(:line_item).permit(:quantity,:product_id, :cart_id)
  end   
