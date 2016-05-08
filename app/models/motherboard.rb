class Motherboard < ActiveRecord::Base
  include PriceHelper
  belongs_to :platform
  #before_save :getPrice
  has_many :processors, through: :platform

end
