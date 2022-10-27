class RemoveProductFromShop < ActiveRecord::Migration[6.1]
  def change
    remove_reference :shops, :product, null: false, foreign_key: true
  end
end
