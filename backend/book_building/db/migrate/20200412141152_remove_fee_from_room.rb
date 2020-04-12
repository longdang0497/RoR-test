class RemoveFeeFromRoom < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :rental_fee
    remove_column :rooms, :management_fee
  end
end
