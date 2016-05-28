class StaticController < ApplicationController
  skip_before_action :authenticate_user!
  def index
  end

  def about
  end

  def examples
  end
end
