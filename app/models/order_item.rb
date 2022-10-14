class OrderItem < ApplicationRecord
  include PriceExtension


  belongs_to :product
  belongs_to :shoppingcart
  belongs_to :order
  belongs_to :promo, optional: true

  
  def get_product(product_id)
    id = product_id
    @product = Product.find(id)
  end  
  

end
