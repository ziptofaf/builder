class AddPictureToMemory < ActiveRecord::Migration
  def change
    add_column :memories, :picture, :string
  end
end
