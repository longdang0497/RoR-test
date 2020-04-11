class AddAddressToBuilding < ActiveRecord::Migration[6.0]
  def change
    add_column :buildings, :address, :string, :default => ""
  end
end
