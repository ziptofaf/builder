class AdminController < ApplicationController
  before_action :is_admin?
  def list
  end
end
