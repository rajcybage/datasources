json.array!(@csv_imports) do |csv_import|
  json.extract! csv_import, :id, :data
  json.url csv_import_url(csv_import, format: :json)
end
