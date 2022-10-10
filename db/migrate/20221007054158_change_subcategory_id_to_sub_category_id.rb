class ChangeSubcategoryIdToSubCategoryId < ActiveRecord::Migration[6.1]
  def change
    rename_column :product_categories, :subcategory_id, :sub_category_id
  end
end
