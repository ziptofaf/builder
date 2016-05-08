class Processor < ActiveRecord::Base
  include PriceHelper
  belongs_to :platform
  before_save :calculateAverage, :getPrice

  def calculateAverage
    self.average = (self.single + self.multi) / 2
  end


end
