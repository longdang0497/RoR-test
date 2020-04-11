class CreateFloors < ActiveRecord::Migration[6.0]
  def change
    create_table :floors do |t|
      t.string :floor_num
      t.integer :total_room
      t.integer :status

      t.timestamps
    end
  end
end
