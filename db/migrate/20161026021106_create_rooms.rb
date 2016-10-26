class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :description
      t.string :location
      t.integer :capacity
      t.references :center, foreign_key: true

      t.timestamps
    end
  end
end
