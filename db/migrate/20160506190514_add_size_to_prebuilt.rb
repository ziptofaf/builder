class AddSizeToPrebuilt < ActiveRecord::Migration
  def change
    add_column :prebuilts, :size, :integer
  end
end
