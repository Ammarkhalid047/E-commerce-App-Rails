class AddPromoToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :promo
  end
end
