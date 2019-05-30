class AddTemperatureToMap < ActiveRecord::Migration[5.2]
  def change
    add_column :maps, :temperature, :float
  end
end
