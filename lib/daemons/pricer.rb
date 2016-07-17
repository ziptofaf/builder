#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "development"

root = File.expand_path(File.dirname(__FILE__))
root = File.dirname(root) until File.exists?(File.join(root, 'config'))
Dir.chdir(root)

require File.join(root, "config", "environment")

$running = true
Signal.trap("TERM") do
  $running = false
end

include FilesHelper
while($running) do
  regenerateBuilderServerFiles
  # Replace this with your code
  #Rails.logger.auto_flushing = true
  #Rails.logger.info "This daemon is still running at #{Time.now}.\n"

  Processor.all.each do |part|
    part.getPrice
    part.save
    sleep 60
  end
  Motherboard.all.each do |part|
    part.getPrice
    part.save
    sleep 60
  end
  Graphic.all.each do |part|
    part.getPrice
    part.save
    sleep 60
  end
  Memory.all.each do |part|
    part.getPrice
    part.save
    sleep 60
  end
  PowerSupply.all.each do |part|
    part.getPrice
    part.save
    sleep 60
  end
  Drive.all.each do |part|
    part.getPrice
    part.save
    sleep 60
  end


end
