class AddPictureToProcessor < ActiveRecord::Migration
  def change
    add_column :processors, :picture, :string
  end
end
