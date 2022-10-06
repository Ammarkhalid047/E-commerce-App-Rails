class RemoveCategoryFromProductCategories < ActiveRecord::Migration[6.1]
  def change
    remove_reference :product_categories, :category, null: false, foreign_key: true
  end
end
