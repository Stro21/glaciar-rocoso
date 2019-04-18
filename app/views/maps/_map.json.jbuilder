json.extract! map, :id, :latitude, :longitude, :url, :elevation, :zoom, :width, :height, :created_at, :updated_at
json.url map_url(map, format: :json)
