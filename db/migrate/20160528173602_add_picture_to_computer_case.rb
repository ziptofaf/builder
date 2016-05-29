class AddPictureToComputerCase < ActiveRecord::Migration
  def change
    add_column :computer_cases, :picture, :string
  end
end
