class AddAdminToBuilding < ActiveRecord::Migration[6.0]
  def change
    add_reference :buildings, :admin, foreign_key: true, nil: false
  end
end
