class CreateListOfMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :list_of_maps do |t|
      t.references :user, foreign_key: true
      t.references :map, foreign_key: true
      t.boolean :rock_glacier

      t.timestamps
    end
  end
end
