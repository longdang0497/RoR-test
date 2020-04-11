class AddBuildingToFloors < ActiveRecord::Migration[6.0]
  def change
    add_reference :floors, :building, foreign_key: true
  end
end
