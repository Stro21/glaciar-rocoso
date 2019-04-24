class Map < ApplicationRecord
  before_create :generate_url

  has_many :maps_lists
  has_many :users, through: :maps_lists

  def generate_url

    url = 'https://maps.googleapis.com/maps/api/staticmap?center=' + center + generate_zoom
    url += size + '&maptype=satellite&key=AIzaSyBvhG9cq8ZPTw306RIWY6DLMyEU6eiBokE'
    self.url = url
  end

  def generate_zoom
    if self.zoom.nil?
      '&zoom=18'
    else
      '&zoom=' + self.zoom.to_s
    end
  end

  def center
    center = self.latitude.to_s + "," + self.longitude.to_s
  end

  def size
    if !self.width.nil? && !self.height.nil?
      '&size=' + self.width.to_s + 'x' + self.height.to_s
    else
      '&size=800x800'
    end
  end
end
