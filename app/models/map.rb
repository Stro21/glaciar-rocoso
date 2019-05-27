class Map < ApplicationRecord
  before_create :add_remaining_data

  require 'googlemaps/services/client'
  require 'googlemaps/services/elevation'
  include GoogleMaps::Services

  belongs_to :user, dependent: :destroy

  def add_remaining_data
    self.key = 'AIzaSyBvhG9cq8ZPTw306RIWY6DLMyEU6eiBokE'
    self.size = '640x640'
    set_url
    set_elevation
    if self.glaciar_rock.nil?
      self.glaciar_rock = false
    end
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
    lat = ""
    longi = ""
    # lat = self.latitude.to_s
    # longi = self.longitude.to_s
    is_lat = true
    coordinates = self.center.tr('(),', '')
    coordinates.each_char do |i|
      if is_lat
        if i == " "
          is_lat = false
        else
          lat.insert(-1, i)
        end
      else
        longi.insert(-1, i)
      end
    end
    self.latitude = lat.to_f
    self.longitude = longi.to_f
    lat + "," + longi
  end

  def set_elevation
    client = GoogleClient.new(key: self.key, response_format: :json)
    elevation = GoogleMaps::Services::Elevation.new(client)
    result = elevation.query(locations: [{:lat => self.latitude, :lng => self.longitude}])
    hash = result[0]
    self.elevation = hash["elevation"].to_i
  end
end
