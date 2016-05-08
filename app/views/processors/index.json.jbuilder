json.array!(@processors) do |processor|
  json.extract! processor, :id, :name, :single, :multi, :average, :platform_id, :iGPU, :OC, :link, :power, :dollar_price, :euro_price
  json.url processor_url(processor, format: :json)
end
