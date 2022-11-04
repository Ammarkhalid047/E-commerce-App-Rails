class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :country
      t.string :name
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
