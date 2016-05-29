class AddPictureToDrive < ActiveRecord::Migration
  def change
    add_column :drives, :picture, :string
  end
end
