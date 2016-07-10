class Motherboard < ActiveRecord::Base
  include PriceHelper
  belongs_to :platform
  before_create :getPrice
  has_many :processors, through: :platform
  has_many :prebuilts, dependent: :destroy

end
