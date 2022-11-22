class AddNoOfProductsToPlan < ActiveRecord::Migration[6.1]
  def change
    add_column :plans, :no_of_products, :integer
    add_column :plans, :no_of_images, :integer
  end
end
