class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  require 'google_maps_service'
end
