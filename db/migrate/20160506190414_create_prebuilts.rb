class CreatePrebuilts < ActiveRecord::Migration
  def change
    create_table :prebuilts do |t|
      t.decimal :price, precision: 8, scale: 2
      t.string :partlist
      t.decimal :performance, precision: 8, scale: 2
      t.integer :type_build

      t.timestamps null: false
    end
  end
end
