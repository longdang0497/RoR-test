class AddFeeUnitToRooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :rooms, :fee_unit, foreign_key: true, nil: false
  end
end
