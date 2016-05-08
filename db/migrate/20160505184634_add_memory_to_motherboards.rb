class AddMemoryToMotherboards < ActiveRecord::Migration
  def change
    add_column :motherboards, :memory, :integer
  end
end
