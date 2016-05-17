json.array!(@composes) do |compose|
  json.extract! compose, :id, :name, :email, :subject, :message
  json.url compose_url(compose, format: :json)
end
