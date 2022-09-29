class AddUsersToAdditionals < ActiveRecord::Migration[6.1]
  def change
    add_reference :additionals, :user, null: false, foreign_key: true
  end
end
