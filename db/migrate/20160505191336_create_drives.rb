class CreateDrives < ActiveRecord::Migration
  def change
    create_table :drives do |t|
      t.string :name
      t.string :link
      t.decimal :dollar_price, precision: 9, scale: 2
      t.decimal :euro_price, precision: 9, scale: 2
      t.integer :capacity
      t.integer :performance
      t.integer :disk_type

      t.timestamps null: false
    end
  end
end
