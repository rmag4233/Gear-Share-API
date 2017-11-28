class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.references :borrower, references: :users, index: true
      t.references :owner, references: :users, index: true
      t.references :gears, foreign_key: true, index: true
      t.date :loan_start
      t.date :loan_end

      t.timestamps
    end
  end
end
