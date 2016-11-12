class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.string :description
      t.references :teacher, foreign_key: true
      t.references :room, foreign_key: true
      t.references :observation, foreign_key: true
      t.date :date
      t.integer :hour
      t.timestamps
    end
  end
end
