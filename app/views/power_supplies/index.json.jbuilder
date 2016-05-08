json.array!(@power_supplies) do |power_supply|
  json.extract! power_supply, :id, :name, :link, :dollar_price, :euro_price, :power, :performance
  json.url power_supply_url(power_supply, format: :json)
end
