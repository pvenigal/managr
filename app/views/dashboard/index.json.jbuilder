json.array!(@entries) do |entry|
  json.extract! entry, :id, :name, :email
  json.url entry_url(entry, format: :json)
end
