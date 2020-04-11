class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :rental_fee
      t.string :management_fee
      t.string :acreage
      t.string :room_num
      t.integer :status

      t.timestamps
    end
  end
end
