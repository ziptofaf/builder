class CreateProcessors < ActiveRecord::Migration
  def change
    create_table :processors do |t|
      t.string :name
      t.decimal :single, precision: 8, scale: 2
      t.decimal :multi, precision: 8, scale: 2
      t.decimal :average, precision: 8, scale: 2
      t.belongs_to :platform, index: true, foreign_key: true
      t.integer :iGPU
      t.decimal :OC, precision: 5, scale: 2
      t.string :link
      t.integer :power
      t.decimal :dollar_price, precision: 9, scale: 2
      t.decimal :euro_price, precision: 9, scale: 2

      t.timestamps null: false
    end
  end
end
