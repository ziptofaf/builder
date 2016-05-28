class MakerController < ApplicationController
  skip_before_action :authenticate_user!
  def build
  end
end
