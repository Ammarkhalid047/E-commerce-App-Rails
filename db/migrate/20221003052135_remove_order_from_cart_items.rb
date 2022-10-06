class RemoveOrderFromCartItems < ActiveRecord::Migration[6.1]
  def change
    remove_reference :cart_items, :order, null: false
  end
end
