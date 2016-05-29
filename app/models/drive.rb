class Drive < ActiveRecord::Base
  include PriceHelper
  has_many :prebuilts, dependent: :destroy
  before_save :getPrice, :max_of_hundred

  def max_of_hundred
    if self.performance > 100
      ratio = self.performance / 100.0
      Drive.all.each do |drive|
        drive.performance = drive.performance / ratio
        drive.save
      end
      self.performance = 100
    end
  end
end
