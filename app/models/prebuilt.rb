class Prebuilt < ActiveRecord::Base
  belongs_to :processor
  belongs_to :motherboard
  belongs_to :graphic
  belongs_to :memory
  belongs_to :drive
  belongs_to :power_supply
  belongs_to :computer_case

  validates :processor, presence: true
  validates :motherboard, presence: true
  validates :graphic, presence: true
  validates :memory, presence: true
  validates :drive, presence: true
  validates :power_supply, presence: true
  validates :computer_case, presence: true
end
