class CartItem < ApplicationRecord
    include PriceExtension


    belongs_to :product
    belongs_to :shoppingcart

    belongs_to :promo, optional: true

    enum discount: {inactive: 0, active: 1}
    
    @total = 0;
    
    def get_product(product_id)
        id = product_id
        @product = Product.find(id)
    end  

    

    
end
