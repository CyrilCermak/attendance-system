json.array!(@workers) do |worker|
  json.extract! worker, :id, :mac, :first_name, :ip, :mac, :state, :last_name
  json.url worker_url(worker, format: :json)
end
