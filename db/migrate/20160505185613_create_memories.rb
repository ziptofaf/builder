class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.integer :ram_type
      t.string :name
      t.string :link
      t.decimal :dollar_price, precision: 9, scale: 2
      t.decimal :euro_price, precision: 9, scale: 2
      t.integer :sticks
      t.integer :capacity
      t.integer :score

      t.timestamps null: false
    end
  end
end
