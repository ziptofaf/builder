class PowerSupply < ActiveRecord::Base
  include PriceHelper
  before_save :getPrice
end
