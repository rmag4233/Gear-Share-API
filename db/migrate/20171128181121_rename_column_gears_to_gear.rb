class RenameColumnGearsToGear < ActiveRecord::Migration[5.1]
  def change
    rename_column :loans, :gears_id, :gear_id
  end
end
