class Map < ApplicationRecord
  before_create :add_remaining_data

  require 'googlemaps/services/client'
  require 'googlemaps/services/elevation'
  include GoogleMaps::Services

  has_many :mapslists
  has_many :users, through: :mapslists

  def add_remaining_data
    set_key
    set_url
    set_elevation
  end

  def set_url
    url = 'https://maps.googleapis.com/maps/api/staticmap?center=' + center + set_zoom
    url += size + '&maptype=satellite&key=' + self.key
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

  def center
    lat = self.latitude.to_s
    longi = self.longitude.to_s 
    lat + "," + longi
  end

  def size
    if !self.width.nil? && !self.height.nil?
      '&size=' + self.width.to_s + 'x' + self.height.to_s
    else
      self.width = 800
      self.height = 800
      '&size=800x800'
    end
  end

  def set_key
    self.key = 'AIzaSyBvhG9cq8ZPTw306RIWY6DLMyEU6eiBokE'
  end

  def set_elevation
    client = GoogleClient.new(key: self.key, response_format: :json)
    elevation = GoogleMaps::Services::Elevation.new(client)
    result = elevation.query(locations: [{:lat => self.latitude, :lng => self.longitude}])
    hash = result[0]
    self.elevation = hash["elevation"].to_i
  end
end
