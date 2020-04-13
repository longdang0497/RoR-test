class RemoveAdminFromBooking < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :admin_id
  end
end
