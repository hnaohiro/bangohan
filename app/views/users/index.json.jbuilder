json.array!(@users) do |user|
  json.extract! user, :id, :name, :hour, :min, :defined, :need, :order
  json.url user_url(user, format: :json)
end
