class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :shoppingcart
  belongs_to :order

  def get_product(product_id)
    id = product_id
    @product = Product.find(id)
end  
end
