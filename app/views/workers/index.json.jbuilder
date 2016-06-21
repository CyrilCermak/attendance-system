json.array!(@warkers) do |warker|
  json.extract! warker, :id, :mac, :first_name, :ip, :mac, :state, :last_name
  json.url warker_url(warker, format: :json)
end
