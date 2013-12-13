json.array!(@arts) do |art|
  json.extract! art, :id, :user_id, :moment_id
  json.url art_url(art, format: :json)
end
