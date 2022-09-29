class AdminController < ApplicationController
    def index
        
    end

    def create
    end

    def create_category
    end

    def create_product
        @categories = Category.all
    end

    def destroy
    end


end
