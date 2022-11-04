class CartItemController < ApplicationController
    protect_from_forgery with: :null_session
    
    def show

        @cart_item = CartItem.find(params[:id])
        @product = Product.find(@cart_item.product.id)
        @product.stock+= @cart_item.quantity
        @cart_item.destroy
        @product.save
        
        redirect_to shoppingcart_path
    end

    def create
        
        selected_product = Product.find(params[:product_id])
        current_cart = current_user.shoppingcart
        
        if current_cart.products.include?(selected_product)
            
            @cart_item = current_cart.cart_items.find_by(:product_id => selected_product.id)
            @cart_item.quantity += 1
            @cart_item.product.stock -=1
        else
            
            @cart_item = CartItem.new
            @cart_item.shoppingcart = current_cart
            @cart_item.product = selected_product
            @cart_item.quantity = 1
            @product = Product.find(@cart_item.product.id)
            @product.stock -=1 
        end
        @cart_item.save
        @product.save
        respond_to do |format|
            format.html { redirect_to post_path(@post) }
            format.json { head :no_content }
            format.js   { render :layout => false }
         end
        
    
    end


    def add_quantity
        @cart_item = CartItem.find(params[:id])
        @cart_item.quantity += 1
        @product = Product.find(@cart_item.product.id)
        @product.stock -=1
        @cart_item.save
        @product.save
        redirect_to shoppingcart_path 
    end

    def reduce_quantity
        @cart_item = CartItem.find(params[:id])
        @product = Product.find(@cart_item.product.id)
        Product.reduce_stock(@cart_item, @product)
        @cart_item.save
        @product.save
        redirect_to shoppingcart_path 
    end

    def destroy
        @cart_item = cartItem.find(params[:id])
        @product.stock+= @cart.quantity
        @cart_item.destroy
        @product.save
        redirect_to shoppingcart_path
    end
    
end
private
  def cart_item_params
    params.require(:cart_item).permit(:quantity,:product_id, :cart_id)
  end 
