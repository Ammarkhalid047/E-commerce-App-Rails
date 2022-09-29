class AddUserToShoppingcart < ActiveRecord::Migration[6.1]
  def change
    add_reference :shoppingcarts, :user, null: false, foreign_key: true
  end
end
