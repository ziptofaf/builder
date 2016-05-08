json.array!(@prebuilts) do |prebuilt|
  json.extract! prebuilt, :id, :price, :partlist, :performance, :type_build
  json.url prebuilt_url(prebuilt, format: :json)
end
