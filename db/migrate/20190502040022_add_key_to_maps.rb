class AddKeyToMaps < ActiveRecord::Migration[5.2]
  def change
    add_column :maps, :key, :string
  end
end
