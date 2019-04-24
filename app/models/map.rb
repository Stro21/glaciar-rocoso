class Map < ApplicationRecord
  has_many :maps_lists
  has_many :users, through: :maps_lists
end
