module FilesHelper

  def smallify
    path = Rails.root.to_s+"/public/images"
    smaller_path = path + "/small"
    files = Dir.entries(path)
    files.delete(".")
    files.delete("..")
    files.each do |file|
      split = file.split(".")
      split[0]+= "_small"
      split = split.join(".")
      system ("convert #{path+'/'+file} -resize 120x120 #{smaller_path+'/'+split}")
    end
  end

  def regenerateBuilderServerFiles

    path = Rails.root.to_s+"/building-c-server/elements/"
    files = ["cpu.txt", "mobo.txt", "gpu.txt", "ram.txt", "psu.txt", "drive.txt", "case.txt", "platform.txt"]
    which_model = ["Processor", "Motherboard", "Graphic", "Memory", "PowerSupply", "Drive", "ComputerCase", "Platform"]
    for i in 0..7
      text = eval("#{which_model[i]}.all.to_json")
      file = File.open(path+files[i], "w")
      file.write(text)
      file.close
    end
  end
end
