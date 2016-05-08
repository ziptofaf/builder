class CreateGraphics < ActiveRecord::Migration
  def change
    create_table :graphics do |t|
      t.string :name
      t.string :link
      t.integer :size
      t.decimal :dollar_price, precision: 9, scale: 2
      t.decimal :euro_price, precision: 9, scale: 2
      t.decimal :cpu_average, precision: 9, scale: 2
      t.decimal :performance, precision: 9, scale: 2
      t.integer :power

      t.timestamps null: false
    end
  end
end
