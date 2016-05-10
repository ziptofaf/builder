class AddCurrencyToPrebuilt < ActiveRecord::Migration
  def change
    add_column :prebuilts, :currency, :integer
  end
end
