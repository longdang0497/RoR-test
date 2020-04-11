class RenameLocationInBuilding < ActiveRecord::Migration[6.0]
  def change
    rename_column :buildings, :location, :city
  end
end
