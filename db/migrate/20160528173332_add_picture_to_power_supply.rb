class AddPictureToPowerSupply < ActiveRecord::Migration
  def change
    add_column :power_supplies, :picture, :string
  end
end
