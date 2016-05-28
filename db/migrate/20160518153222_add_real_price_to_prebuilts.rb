class AddRealPriceToPrebuilts < ActiveRecord::Migration
  def change
    add_column :prebuilts, :real_price, :decimal, precision: 5, scale: 2
  end
end
