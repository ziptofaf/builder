json.array!(@graphics) do |graphic|
  json.extract! graphic, :id, :name, :link, :size, :dollar_price, :euro_price, :cpu_average, :performance, :power
  json.url graphic_url(graphic, format: :json)
end
