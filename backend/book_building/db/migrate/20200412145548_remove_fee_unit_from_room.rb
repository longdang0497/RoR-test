class RemoveFeeUnitFromRoom < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :fee_unit_id
  end
end
