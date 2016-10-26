class CreateResourcesRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :resources_rooms, :id => false do |t|
      t.references :resource
      t.references :room
    end
    #add_index :resources_rooms, :resource_id
    #add_index :resources_rooms, :room_id
  end
end
