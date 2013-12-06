json.array!(@moments) do |moment|
  json.extract! moment, :id, :sentence, :day
  json.url moment_url(moment, format: :json)
end
