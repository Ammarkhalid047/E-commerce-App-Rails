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
      end   

      def create
        @order = current_user.order.new(order_params)
        current_cart = current_user.shoppingcart
        current_cart.cart_items.each do |item|
            @order_item = @order.order_items.new
            @order_item.shoppingcart = current_cart
            @order_item.product = item.product
            @order_item.quantity = item.quantity
            @order_item.promo = item.promo
            @order_item.save
        end
        if @order.save
          current_cart.cart_items.delete_all
          flash.notice = "Your Order Has Been Successfully Placed!"
          redirect_to root_path
        else
          flash.alert = "Your Order Cannot be Placed at the moment, Please try later!"
          redirect_to root_path
        end
      end

      private
        def order_params
          params.require(:order).permit(:name, :email, :address, :pay_method,:lastname)
        end
        
end
