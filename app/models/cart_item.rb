class CartItem < ApplicationRecord
    belongs_to :product
    belongs_to :shoppingcart

    def get_product(product_id)
        id = product_id
        @product = Product.find(id)
    end  
end
