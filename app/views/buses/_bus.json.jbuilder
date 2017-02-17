json.extract! bus, :id, :bus_model_id, :plate_no, :date_purchased, :repair_id, :odometer, :bus_line_id, :cpk, :created_at, :updated_at
json.url bus_url(bus, format: :json)