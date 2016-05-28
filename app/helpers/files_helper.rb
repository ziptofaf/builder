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
      system ("convert #{path+'/'+file} -resize 200x200 #{smaller_path+'/'+split}")
    end
  end
end
