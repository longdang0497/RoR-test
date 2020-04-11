class AddAdminToRooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :rooms, :admin, foreign_key: true, nil: false
  end
end
