class AddUserToGears < ActiveRecord::Migration[5.1]
  def change
    add_reference :gears, :user, foreign_key: true
  end
end
