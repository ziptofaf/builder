class RemovePartlistFromPrebuilts < ActiveRecord::Migration
  def change
    remove_column :prebuilts, :partlist, :string
  end
end
