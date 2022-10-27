class Seller::ShopController < ApplicationController
    load_and_authorize_resource
    
    def edit
        @shop = current_user.shop
    end
    def update
        @shop = Shop.find(params[:id])
        if @shop.update(shop_params)
            flash.notice = 'Shop Edited Successfully!'
        else
            flash.notice = 'Oops! Theres been some issue, Please try later!'
        end
        redirect_to edit_seller_shop_path(@shop.id)
    end

    private
  
    def shop_params
        params.require(:shop).permit(:name, :discount, :value)
    end

end
