class RemoveProductFromPromos < ActiveRecord::Migration[6.1]
  def change
    remove_reference :promos, :product, null: false
  end
end
