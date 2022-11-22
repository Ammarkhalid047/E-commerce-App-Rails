class DropPlanFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :plan
  end
end
