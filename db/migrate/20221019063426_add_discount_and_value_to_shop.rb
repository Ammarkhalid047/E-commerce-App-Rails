class AddDiscountAndValueToShop < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :discount, :boolean, :default => false
    add_column :shops, :value, :integer, :default => 0
  end
end
