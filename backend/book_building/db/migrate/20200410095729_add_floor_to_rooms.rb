class AddFloorToRooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :rooms, :floor, foreign_key: true
  end
end
