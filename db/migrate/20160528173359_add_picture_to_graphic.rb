class AddPictureToGraphic < ActiveRecord::Migration
  def change
    add_column :graphics, :picture, :string
  end
end
