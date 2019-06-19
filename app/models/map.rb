class Map < ApplicationRecord
  before_create :add_remaining_data
  before_update :edit_data

  require 'googlemaps/services/client'
  require 'googlemaps/services/elevation'
  include GoogleMaps::Services

  belongs_to :user

  def add_remaining_data
    env_var
    self.size = '640x640'
    set_url
    set_elevation
    if self.rock_glacier.nil?
      self.rock_glacier = false
    end
    if self.name.nil? || self.name == ''
      if Map.last.nil?
        self.name = 'Mapa1'
      else
        self.name = 'Mapa' + (Map.last.id).to_s
      end
    end
    weather
  end

  def set_url
    url = 'https://maps.googleapis.com/maps/api/staticmap?center=' + get_center + set_zoom
    url += '&size=' + self.size + '&maptype=satellite&key=' + self.key
    self.url = url
  end

  def set_zoom
    if self.zoom.nil?
      self.zoom = 18
      '&zoom=18'
    else
      '&zoom=' + self.zoom.to_s
    end
  end

  def get_center
    coordinates = self.center.tr('(),', '')
    latlongi = coordinates.split(' ')
    self.latitude = latlongi[0].to_f
    self.longitude = latlongi[1].to_f
    latlongi[0] + ',' + latlongi[1]
  end

  def set_elevation
    client = GoogleClient.new(key: self.key, response_format: :json)
    elevation = GoogleMaps::Services::Elevation.new(client)
    result = elevation.query(locations: [{:lat => self.latitude, :lng => self.longitude}])
    hash = result[0]
    self.elevation = hash["elevation"].to_i
  end

  def edit_data
    env_var
    set_url
    set_elevation
    weather
  end

  def weather
    generate_json
    add_weather_data
  end

  def generate_json
    weather = 'https://api.openweathermap.org/data/2.5/weather?'
    weather += 'lat=' + self.latitude.to_s + '&'
    weather += 'lon=' + self.longitude.to_s + '&'
    weather += '&appid=' + self.weather_key
    weather += '&units=metric'
    self.weather_json = weather
  end

  def add_weather_data
    require 'open-uri'
    json = JSON.load(open(self.weather_json))
    json.symbolize_keys!
    json.deep_symbolize_keys!
    self.temperature = json[:main][:temp]
  end

  def env_var
    self.key = ENV["googlemap_api_key"]
    self.weather_key = ENV["openweathermap_api_key"]
  end
end
