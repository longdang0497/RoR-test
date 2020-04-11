class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.string :location
      t.integer :build_year
      t.string :equipments
      t.integer :floor_number

      t.timestamps
    end
  end
end
