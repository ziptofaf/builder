json.array!(@drives) do |drife|
  json.extract! drife, :id, :name, :link, :dollar_price, :euro_price, :capacity, :performance, :disk_type
  json.url drife_url(drife, format: :json)
end
