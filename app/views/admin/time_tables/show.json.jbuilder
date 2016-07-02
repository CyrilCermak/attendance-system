json.array!(@time_tables) do |table|
  # json.extract! table, :id, :arrival, :departure
  json.id @worker.id
  json.title "Worked"
  json.description ""
  json.star table.arrival
  json.end table.departure
  json.url admin_time_table_url(@worker,format: :html)
end
