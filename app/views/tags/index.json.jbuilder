json.array!(@tags) do |tag|
  json.extract! tag, :id, :title, :color
  json.url tag_url(tag, format: :json)
end
