json.extract! bus_line, :id, :linename, :distance, :created_at, :updated_at
json.url bus_line_url(bus_line, format: :json)