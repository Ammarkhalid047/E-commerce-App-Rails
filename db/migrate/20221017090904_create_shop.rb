class CreateShop < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
