class AddSubCategoryToPromo < ActiveRecord::Migration[6.1]
  def change
    add_reference :promos, :sub_category, foreign_key: true
  end
end
