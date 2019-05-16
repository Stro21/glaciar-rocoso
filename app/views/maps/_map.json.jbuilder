json.extract! map, :id, :name, :latitude, :longitude, :url, :elevation, :zoom, :size, :created_at, :updated_at
json.url map_url(map, format: :json)
