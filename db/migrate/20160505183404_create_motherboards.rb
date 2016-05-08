class CreateMotherboards < ActiveRecord::Migration
  def change
    create_table :motherboards do |t|
      t.string :name
      t.belongs_to :platform, index: true, foreign_key: true
      t.string :link
      t.integer :size
      t.decimal :OC, precision: 5, scale: 2
      t.integer :ram_slots
      t.decimal :dollar_price, precision: 9, scale: 2
      t.decimal :euro_price, precision: 9, scale: 2
      t.integer :score

      t.timestamps null: false
    end
  end
end
