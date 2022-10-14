class ReviewController < ApplicationController
    
    
    def create
        @review = current_user.reviews.new(review_params)
        if @review.save
            @product = Product.find((params[:review][:product_id]).to_i)
            @reviews = @product.reviews
            flash.alert = "Your Review has been added to the Product, Thankyou for your feedback!"
        else
            flash.alert = "Sorry, Your review cannot be added at the moment, please try later."
        end
        respond_to do |format|
            format.html { redirect_to index }
            format.json { head :no_content }
            format.js   { render :layout => false }
         end
    end
    
    
    def like
        @product = Product.find(params[:id])
        @like = @product.likes.find_by_user_id(current_user.id)
        if @like.present?
            if @like.destroy
                flash.notice = "You have successfully unliked this product"
                redirect_to product_path(@product.id)
            else 
                flash.alert = "Product can't be unliked at the moment, Please try later."
                redirect_to product_path(@product.id)
            end
        else
            @product = Product.find(params[:id])
            if @product.likes.create(user_id: current_user.id)
                flash.notice = "You have successfully Liked this product"
                redirect_to product_path(@product.id)
            else 
                flash.alert = "Product can't be liked at the moment, Please try later."
                redirect_to product_path(@product.id)
            end
        end
        
    end

    private
        def review_params
          params.require(:review).permit(:description, :product_id, :rating)
        end
end
