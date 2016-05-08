json.array!(@motherboards) do |motherboard|
  json.extract! motherboard, :id, :name, :platform_id, :link, :size, :OC, :ram_slots, :dollar_price, :euro_price, :score
  json.url motherboard_url(motherboard, format: :json)
end
