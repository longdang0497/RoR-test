class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :messages
      t.string :profession, null: false
      t.string :service_length, null: false
      t.string :desired_time      

      t.timestamps
    end
  end
end
