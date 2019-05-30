class AddWeatherUrlToMap < ActiveRecord::Migration[5.2]
  def change
    add_column :maps, :weather_url, :string
  end
end
