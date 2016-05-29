class ComputerCase < ActiveRecord::Base
  has_many :prebuilts, dependent: :destroy
end
