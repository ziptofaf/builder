class Graphic < ActiveRecord::Base
  include PriceHelper
  #before_save :getPrice
end
