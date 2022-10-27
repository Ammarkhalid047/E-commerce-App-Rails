class Admin::PromoController < ApplicationController
    load_and_authorize_resource
    def new
        @subcategories = SubCategory.all
    end

    def create
        @promo = Promo.new(promo_params)
        @product = Product.find(params[:promo][:product_id])
        if @promo.save
        @product.promo_id = @promo.id
        @product.save
        end
        redirect_to admin_promo_index_path
    end    

    def check_promo
        if Promo.exists?(:name => params[:promo][:name])
            promo = Promo.find_by_name(params[:promo][:name])
            # @promo_products = Product.where(promo_id: promo.id).joins(cart_items: :shoppingcart).where(:shoppingcart => {:id => current_user.shoppingcart.id})
            @cart = current_user.shoppingcart.cart_items
            @cart_promo = CartItem.joins(:product, :shoppingcart).where(:product => {:promo_id => promo.id}, :shoppingcart => {:id => current_user.shoppingcart.id})
            @cart_promo.each do |cart_item|
                if cart_item.promo.nil?
                    cart_item.promo = promo
                    cart_item.save
                end
            end
            respond_to do |format|
                format.html { redirect_to index }
                format.json { head :no_content }
                format.js   { render :layout => false }
             end
        else
            puts('Promo Not found')
        end
    end

    private
  
    def promo_params
        params.require(:promo).permit(:name, :value, :type)
    end

end