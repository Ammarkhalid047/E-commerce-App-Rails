class CreateShoppingcarts < ActiveRecord::Migration[6.1]
  def change
    create_table :shoppingcarts do |t|

      t.timestamps
    end
  end
end
