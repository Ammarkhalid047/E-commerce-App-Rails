class AddPromoToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :order_items, :promo, foreign_key: true
  end
end
