class RemoveWidthAndHeightFromMap < ActiveRecord::Migration[5.2]
  def change
    remove_column :maps, :width, :integer
    remove_column :maps, :height, :integer
  end
end
