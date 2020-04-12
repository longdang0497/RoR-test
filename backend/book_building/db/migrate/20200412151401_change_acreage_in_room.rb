class ChangeAcreageInRoom < ActiveRecord::Migration[6.0]
  def change
    change_column :rooms, :acreage, 'float USING CAST (acreage AS float)'
  end
end
