class Map < ApplicationRecord
  before_create :add_remaining_data

  has_many :maps_lists
  has_many :users, through: :maps_lists

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
    lat = (self.latitude * -1).to_s
    longi = (self.longitude * -1).to_s 
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
    require 'google_maps_service'
    gmaps = GoogleMapsService::Client.new(key: self.key)
    location = [self.latitude, self.longitude]
    results = gmaps.elevation(location)
    self.elevation = results
  end
end
