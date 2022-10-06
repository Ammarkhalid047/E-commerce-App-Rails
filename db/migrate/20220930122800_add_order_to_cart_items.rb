class AddOrderToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :cart_items, :order
  end
end
