class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :shoppingcart
  belongs_to :order
  belongs_to :promo, optional: true

  
  def get_product(product_id)
    id = product_id
    @product = Product.find(id)
  end  

  def get_price
    if self.promo.nil?
        (product.price).to_i * (self.quantity).to_i
    else
        if self.promo.type == 'flat'
            ((self.product.price).to_i)-(self.promo.value) * (self.quantity).to_i
        else
            ((self.product.price).to_f-((self.product.price).to_f)/100*(self.promo.value)) * (self.quantity).to_f
        end
    end
end
  

end
