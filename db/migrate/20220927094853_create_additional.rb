class CreateAdditional < ActiveRecord::Migration[6.1]
  def change
    create_table :additionals do |t|
      t.string :street
      t.string :zip
      t.string :country
      t.string :city
      t.string :phone

      t.timestamps
    end
  end
end
