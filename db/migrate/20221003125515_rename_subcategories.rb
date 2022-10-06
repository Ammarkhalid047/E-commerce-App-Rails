class RenameSubcategories < ActiveRecord::Migration[6.1]
  def change
    rename_table :subcategories, :sub_categories
  end
end
