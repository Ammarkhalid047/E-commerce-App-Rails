class AddSubcategoryToProductCategories < ActiveRecord::Migration[6.1]
  def change
    add_reference :product_categories, :subcategory, foreign_key: true
  end
end
