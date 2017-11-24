class CreateGears < ActiveRecord::Migration[5.1]
  def change
    create_table :gears do |t|
      t.string :title
      t.string :description
      t.string :price
      t.boolean :availability
      t.string :image_URL

      t.timestamps
    end
  end
end
