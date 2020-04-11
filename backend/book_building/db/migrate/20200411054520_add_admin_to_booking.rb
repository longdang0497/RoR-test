class AddAdminToBooking < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :admin, foreign_key: true, nil: false
  end
end
