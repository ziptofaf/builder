json.array!(@memories) do |memory|
  json.extract! memory, :id, :ram_type, :name, :link, :dollar_price, :euro_price, :sticks, :capacity, :score
  json.url memory_url(memory, format: :json)
end
