class OrderController < ApplicationController

    def index
        @orders = Order.all
      end
    
      def show
        @order = Order.find(params[:id])
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
            @order_item.save
        end
        if @order.save
          current_cart.cart_items.delete_all
          flash.alert = "Your Order Has Been Successfully Placed!"
          redirect_to root_path
        else
          flash.alert = "Your Order Cannot be Placed at the moment, Please try later!"
          redirect_to root_path
        end
      end

      def update
      @order = Order.find(params[:id])
      if @order.status == 'shipped'
        @order.status = 'pending'
      elsif @order.status == 'pending'
        @order.status = 'shipped'
      end
      @order.save
      redirect_to order_path(@order.id)
      end

      private
        def order_params
          params.require(:order).permit(:name, :email, :address, :pay_method,:lastname)
        end
        
end
