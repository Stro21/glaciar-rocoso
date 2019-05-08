class CreateMaplists < ActiveRecord::Migration[5.2]
  def change
    create_table :maplists do |t|
      t.references :user, foreign_key: true
      t.references :map, foreign_key: true
      t.boolean :glaciar_rock

      t.timestamps
    end
  end
end
