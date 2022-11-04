class CartItem < ApplicationRecord
    include PriceExtension
    
    belongs_to :product
    belongs_to :shoppingcart

    belongs_to :promo, optional: true

    enum discount: {inactive: 0, active: 1}

    scope :discounted_items, -> (promo) {includes(product: :sub_categories).where(:sub_categories => {:code => promo})}
    

    def get_product(product_id)
        id = product_id
        @product = Product.find(id)
    end

    def self.createOrderItems(order, current_cart,cart_items, promo_items)
        cart_items.each do |item|
            order_item = order.order_items.new(shoppingcart: current_cart, product: item.product, quantity: item.quantity)
            if !promo_items.nil?
            promo_items.each do |promo_item|  
                if promo_item == item    
                order_item.price = item.get_price(promo_item)
                end
                if item.product.sub_categories.last.code != promo
                order_item.price = item.orignial_price
                end
            end
            elsif promo_items.nil?
            order_item.price = item.orignial_price
            end
            order_item.save
        end
   
    end

    
end
