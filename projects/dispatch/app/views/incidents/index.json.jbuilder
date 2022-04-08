json.array!(@incidents) do |incident|
  json.extract! incident, :id, :location, :report_date, :start_date, :checkout_date, :resolve_date, :incident_type_id, :severity, :bump_count, :name
  json.url incident_url(incident, format: :json)
end
