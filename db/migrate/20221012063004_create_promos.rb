class CreatePromos < ActiveRecord::Migration[6.1]
  def change
    create_table :promos do |t|
      t.string :name
      t.integer :value
      t.integer :type
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
