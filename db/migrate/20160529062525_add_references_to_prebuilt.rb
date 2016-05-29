class AddReferencesToPrebuilt < ActiveRecord::Migration
  def change
    add_reference :prebuilts, :processor, index: true, foreign_key: true
    add_reference :prebuilts, :graphic, index: true, foreign_key: true
    add_reference :prebuilts, :computer_case, index: true, foreign_key: true
    add_reference :prebuilts, :drive, index: true, foreign_key: true
    add_reference :prebuilts, :motherboard, index: true, foreign_key: true
    add_reference :prebuilts, :power_supply, index: true, foreign_key: true
    add_reference :prebuilts, :memory, index: true, foreign_key: true


  end
end
