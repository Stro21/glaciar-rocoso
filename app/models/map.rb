class Map < ApplicationRecord
  before_create :add_remaining_data
  before_update :edit_data

  require 'googlemaps/services/client'
  require 'googlemaps/services/elevation'
  include GoogleMaps::Services

  belongs_to :user

  def add_remaining_data
    self.key = 'AIzaSyBvhG9cq8ZPTw306RIWY6DLMyEU6eiBokE'
    self.size = '640x640'
    self.weather_key = '69a465ccc34193baf8afa4d3a3dc6289'
    set_url
    set_elevation
    if self.glaciar_rock.nil?
      self.glaciar_rock = false
    end
    if self.name.nil? || self.name == ''
      if Map.last.nil?
        self.name = 'Mapa1'
      else
        self.name = 'Mapa' + (Map.last.id - 1).to_s
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
    set_url
    set_elevation
  end

  def weather
    weather = 'https://api.openweathermap.org/data/2.5/weather?'
    weather += 'lat=' + self.latitude.to_s + '&'
    weather += 'lon=' + self.longitude.to_s + '&'
    weather += '&appid=' + self.weather_key
    self.weather_url = weather
  end
end
