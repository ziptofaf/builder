class Processor < ActiveRecord::Base
  include PriceHelper
  belongs_to :platform
  before_save :calculateAverage#, :getPrice

  def calculateAverage
    self.average = 0.46 * self.single + 0.54 * self.multi
  end


end
