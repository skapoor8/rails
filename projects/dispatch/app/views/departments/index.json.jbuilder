json.array!(@departments) do |department|
  json.extract! department, :id, :name, :email, :phone
  json.url department_url(department, format: :json)
end
