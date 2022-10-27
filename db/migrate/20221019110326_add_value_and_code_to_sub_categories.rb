class AddValueAndCodeToSubCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :sub_categories, :value, :integer
    add_column :sub_categories, :code, :string
    add_column :sub_categories, :type, :integer
  end
end
