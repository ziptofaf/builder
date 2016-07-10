class PowerSupply < ActiveRecord::Base
  include PriceHelper
  before_save :max_of_hundred
  before_create :getPrice
  has_many :prebuilts, dependent: :destroy


  def max_of_hundred
    if self.performance > 100
      ratio = self.performance / 100.0
      PowerSupply.all.each do |psu|
        psu.performance = psu.performance / ratio
        psu.save
      end
      self.performance = 100
    end
  end
end
