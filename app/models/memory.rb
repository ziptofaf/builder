class Memory < ActiveRecord::Base
  include PriceHelper
  before_save :max_of_hundred
  before_create :getPrice
  has_many :prebuilts, dependent: :destroy


  def max_of_hundred
    if self.score > 100
      ratio = self.score / 100.0
      Memory.all.each do |ram|
        ram.score = ram.score / ratio
        ram.save
      end
      self.score = 100
    end
  end
end
