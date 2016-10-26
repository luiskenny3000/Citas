class CreateDisables < ActiveRecord::Migration[5.0]
  def change
    create_table :disables do |t|
      t.date :begin
      t.date :end
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
