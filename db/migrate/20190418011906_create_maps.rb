class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :url
      t.integer :elevation
      t.integer :zoom
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
