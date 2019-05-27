class ChangeLatitudeAndLongitudeToBeFloatInMaps < ActiveRecord::Migration[5.2]
  def change
    change_column :maps, :latitude, :float
    change_column :maps, :longitude, :float
  end
end
