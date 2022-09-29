class ChangeImagesToBeJson < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :images, 'json USING CAST(images AS json)'
  end
end
