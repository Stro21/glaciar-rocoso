class AddCenterToMap < ActiveRecord::Migration[5.2]
  def change
    add_column :maps, :center, :string
  end
end
