class AddAdminToFloors < ActiveRecord::Migration[6.0]
  def change
    add_reference :floors, :admin, foreign_key: true, nil: false
  end
end
