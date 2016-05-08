class CreateComputerCases < ActiveRecord::Migration
  def change
    create_table :computer_cases do |t|
      t.string :name
      t.string :link
      t.decimal :dollar_price, precision: 9, scale: 2
      t.decimal :euro_price, precision: 9, scale: 2
      t.integer :size
      t.integer :performance

      t.timestamps null: false
    end
  end
end
