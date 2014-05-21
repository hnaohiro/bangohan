json.array!(@devices) do |device|
  json.extract! device, :id, :user_id, :platform_application_arn, :token
end
