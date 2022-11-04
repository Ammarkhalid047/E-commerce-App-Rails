class Admin::SubcategoryController < ApplicationController
    def new

    end

    def index
        @subcategories = SubCategory.all
    end

    def create
        @categories = params[:subcategory][:category]
        new_array = @categories.reject {|x| x == "0"}
        new_array.each do |x|
            @category = Category.find(x)
            @subcategory = @category.sub_categories.new(subcategory_params)
            @subcategory.save
        end
        redirect_to new_admin_category_path
    end


    def show
        @category = Category.find(params[:id])
        @sub_categories = @category.sub_categories
        respond_to do |format|
            format.json { head :no_content }
            format.js   { render :layout => false }
         end
    end

    def promocode
        @categories = Category.all
        @subcategory = SubCategory.find(params[:id])
    end

    def update
        @subcategory = SubCategory.find(params[:id])
        if @subcategory.update(subcategory_params)
            flash.notice = "Promo Code Successfully Added To SubCategory"
        else
            flash.alert = "There has been some error please try again later"
        end
        redirect_to admin_category_index_path
    end

    def destroy
        @subcategory = SubCategory.find(params[:id])
        if @subcategory.destroy
            redirect_to admin_category_index_path
            flash.notice = "SubCategory destroyed Successfully!"
        else 
            redirect_to admin_category_index_path
            flash.alert = "SubCategory couldn't be destroyed, there has been some issue!"
        end
    end


    def check_promo
        @cart = current_user.shoppingcart.cart_items
        cart_items = current_user.shoppingcart.cart_items  
        @promo = params[:subcategory][:name]
        @promo_items = cart_items.includes(product: :sub_categories).where(:sub_categories => {:code => @promo})
        respond_to do |format|
            format.html { redirect_to index }
            format.json { head :no_content }
            format.js   { render :layout => false }
         end
    end


    private
        def subcategory_params
            params.require(:subcategory).permit(:title, :type, :value, :code, :category_id)
        end
end