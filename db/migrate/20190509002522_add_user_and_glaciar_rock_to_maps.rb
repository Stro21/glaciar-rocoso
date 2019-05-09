class AddUserAndGlaciarRockToMaps < ActiveRecord::Migration[5.2]
  def change
    add_reference :maps, :user, foreign_key: true
    add_column :maps, :glaciar_rock, :boolean
  end
end
