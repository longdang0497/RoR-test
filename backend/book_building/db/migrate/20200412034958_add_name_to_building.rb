class AddNameToBuilding < ActiveRecord::Migration[6.0]
  def change
    add_column :buildings, :name, :string, :null => "false", :default => ""
  end
end
