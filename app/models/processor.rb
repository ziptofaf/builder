class Processor < ActiveRecord::Base
  include PriceHelper
  belongs_to :platform
  before_save :max_of_hundred, :calculateAverage #, :getPrice
  has_many :prebuilts, dependent: :destroy

  def calculateAverage
    self.average = 0.46 * self.single + 0.54 * self.multi
  end
  def max_of_hundred

    if (self.single > 100 or self.multi > 100)
      Graphic.RecalculateRequirements(calculateAverage)
    end
    if (self.single > 100)
      ratio = self.single / 100.0
      Processor.all.each do |cpu|
        cpu.single = cpu.single / ratio
        cpu.save
      end
      self.single = 100
    end
    if (self.multi > 100)
      ratio = self.multi / 100.0
      Processor.all.each do |cpu|
        cpu.multi = cpu.multi / ratio
        cpu.save
      end
      self.multi = 100
    end
  end

end
