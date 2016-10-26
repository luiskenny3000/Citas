class CreateHoraries < ActiveRecord::Migration[5.0]
  def change
    create_table :horaries do |t|
      t.references :reservation, foreign_key: true
      t.date :date
      t.time :hour
      t.time :duration

      t.timestamps
    end
  end
end
