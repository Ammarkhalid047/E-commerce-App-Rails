class ReviewController < ApplicationController
    
    
    def create
        @review = current_user.reviews.new(review_params)
        @review.save
        @product = Product.find((params[:product_id]).to_i)
        @reviews = @product.reviews
        respond_to do |format|
            format.html { redirect_to index }
            format.json { head :no_content }
            format.js   { render :layout => false }
         end
    end
    
    
    def like
        @product = Product.find(params[:id])
        @product.likes.create(user_id: current_user.id)
        redirect_to view_product_home_path(@product.id)
    end

    private
        def review_params
          params.permit(:description, :product_id, :rating)
        end
end
