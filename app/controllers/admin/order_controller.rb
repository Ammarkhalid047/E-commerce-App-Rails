class Admin::OrderController < ApplicationController  

  load_and_authorize_resource
    def index
        @orders = Order.all
      end
    
      def show
        @order = Order.find(params[:id])
        @order_items = @order.order_items
      end

      def update
        @order = Order.find(params[:id])
        Order.set_status(@order)
        @order.save
        redirect_to admin_order_path(@order.id)
        end

end