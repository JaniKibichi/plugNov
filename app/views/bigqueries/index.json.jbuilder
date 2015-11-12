json.array!(@bigqueries) do |bigquery|
  json.extract! bigquery, :id, :text, :number
  json.url bigquery_url(bigquery, format: :json)
end
