class AddLastNameToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :lastname, :string
  end
end
