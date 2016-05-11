class Drive < ActiveRecord::Base
  include PriceHelper
  before_save :getPrice
end
