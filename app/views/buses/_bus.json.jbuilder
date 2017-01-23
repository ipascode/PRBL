json.extract! bus, :id, :BusModel_id, :plate_no, :date_purchased, :Repair_id, :odometer, :BusLine_id, :cpk, :created_at, :updated_at
json.url bus_url(bus, format: :json)