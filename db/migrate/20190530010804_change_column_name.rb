class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :maps, :weather_url, :weather_json
  end
end
