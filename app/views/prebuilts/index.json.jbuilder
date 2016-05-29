json.array!(@prebuilts) do |prebuilt|
  json.extract! prebuilt, :id, :price, :processor_id, :motherboard_id, :graphic_id, :memory_id, :drive_id, :power_supply_id, :computer_case_id, :performance, :type_build
  json.url prebuilt_url(prebuilt, format: :json)
end
