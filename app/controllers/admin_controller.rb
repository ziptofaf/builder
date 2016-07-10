class AdminController < ApplicationController
  before_action :is_admin?
  def list
  end
  def add
  end
  def map_images
    entries = image_params[:spread].split(/\n/)
    entries.each do |row|
      entry = row.split(/[\t;]+/)
      name = entry[0]
      image = entry[1]
      toAlter = Processor.find_by name: name
      if toAlter.nil?
        toAlter = Graphic.find_by name: name
      end
      if toAlter.nil?
        toAlter = Memory.find_by name: name
      end
      if toAlter.nil?
        toAlter = PowerSupply.find_by name: name
      end
      if toAlter.nil?
        toAlter = Motherboard.find_by name: name
      end
      if toAlter.nil?
        toAlter = Drive.find_by name: name
      end
      if toAlter.nil?
        next
      end
      toAlter.picture = image
      toAlter.save
    end
    redirect_to admin_path and return
  end
  private
  def image_params
    params.require(:search).permit(:spread)
  end
end
