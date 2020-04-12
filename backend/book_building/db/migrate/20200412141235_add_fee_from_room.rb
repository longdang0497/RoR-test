class AddFeeFromRoom < ActiveRecord::Migration[6.0]
  def change
    add_reference :rooms, :rental_fee, foreign_key: true, nil: false
    add_reference :rooms, :management_fee, foreign_key: true, nil: false
  end
end
