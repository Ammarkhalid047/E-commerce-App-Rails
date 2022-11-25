class OrderController < ApplicationController

      def index
        @orders = current_user.order.all
      end
    
      def show
        @order = current_user.order.find(params[:id])
        @order_items = @order.order_items
      end
      
      def new
        @order = Order.new
        @cart = current_user.shoppingcart.cart_items
        @otp = SecureRandom.hex(5)
      end   

      def authentication
        AuthenticationMailer.otp(params[:email], params[:otp]).deliver_now
      end
      
      def create
        cart_items = current_user.shoppingcart.cart_items  
        promo = params[:order][:promo]
        if promo != nil
        promo_items = cart_items.discounted_items(promo)
        end
        @order = current_user.order.new(order_params)
        current_cart = current_user.shoppingcart
        cart_items = current_cart.cart_items
        CartItem.createOrderItems(@order, current_cart, cart_items, promo_items)
        if @order.save
          current_cart.cart_items.delete_all
          flash.notice = "Your Order Has Been Successfully Placed!"
          redirect_to home_index_path
        else
          flash.alert = "Your Order Cannot be Placed at the moment, Please try later!"
          redirect_to home_index_path
        end
      end

      private
        def order_params
          params.require(:order).permit(:name, :email, :address, :pay_method,:lastname)
        end
        
end
