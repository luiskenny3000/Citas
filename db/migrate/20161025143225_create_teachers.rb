class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :telephone
      t.string :password
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
