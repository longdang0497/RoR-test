class AddAdminToManagementFee < ActiveRecord::Migration[6.0]
  def change
    add_reference :management_fees, :admin, foreign_key: true, nil: false
  end
end
