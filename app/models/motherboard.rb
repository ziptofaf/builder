class Motherboard < ActiveRecord::Base
  include PriceHelper
  belongs_to :platform
  before_save :getPrice
  has_many :processors, through: :platform
  has_many :prebuilts, dependent: :destroy

end
