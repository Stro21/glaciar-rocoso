class ChangeGlaciarRockNameInMaps < ActiveRecord::Migration[5.2]
  def change
    rename_column :maps, :glaciar_rock, :rock_glacier
  end
end
