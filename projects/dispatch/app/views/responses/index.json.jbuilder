json.array!(@responses) do |response|
  json.extract! response, :id, :incident_id, :user_id, :custom_comment
  json.url response_url(response, format: :json)
end
