class Graphic < ActiveRecord::Base
  #include PriceHelper
  has_many :prebuilts, dependent: :destroy
  before_save :max_of_hundred

  def max_of_hundred
    if (self.performance > 100) #scores higher than 100 are impossible as they break the list
      ratio = self.performance / 100.0
      Graphic.all.each do |graphic|
        graphic.performance = graphic.performance / ratio
        graphic.save
      end
      self.performance = 100
    end
    return
  end

def self.RecalculateRequirements(new_avg) #for example if a new more powerful CPU than ever before is added
  return if new_avg < 100
  ratio = new_avg / 100.0
  Graphic.all.each do |gpu|
    gpu.cpu_average = gpu.cpu_average / ratio
    gpu.save
  end
end
end
