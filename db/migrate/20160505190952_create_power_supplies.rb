class CreatePowerSupplies < ActiveRecord::Migration
  def change
    create_table :power_supplies do |t|
      t.string :name
      t.string :link
      t.decimal :dollar_price, precision: 9, scale: 2
      t.decimal :euro_price, precision: 9, scale: 2
      t.integer :power
      t.integer :performance

      t.timestamps null: false
    end
  end
end
