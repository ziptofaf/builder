class AddPictureToMotherboard < ActiveRecord::Migration
  def change
    add_column :motherboards, :picture, :string
  end
end
