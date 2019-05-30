class AddWeatherKeyToMap < ActiveRecord::Migration[5.2]
  def change
    add_column :maps, :weather_key, :string
  end
end
