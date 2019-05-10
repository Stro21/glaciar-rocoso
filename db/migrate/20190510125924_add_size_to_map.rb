class AddSizeToMap < ActiveRecord::Migration[5.2]
  def change
    add_column :maps, :size, :string
  end
end
