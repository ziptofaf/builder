json.array!(@computer_cases) do |computer_case|
  json.extract! computer_case, :id, :name, :link, :dollar_price, :euro_price, :size, :performance
  json.url computer_case_url(computer_case, format: :json)
end
