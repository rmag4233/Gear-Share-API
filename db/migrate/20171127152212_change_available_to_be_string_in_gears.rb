class ChangeAvailableToBeStringInGears < ActiveRecord::Migration[5.1]
  def change
    change_column :gears, :availability, :string
  end
end
