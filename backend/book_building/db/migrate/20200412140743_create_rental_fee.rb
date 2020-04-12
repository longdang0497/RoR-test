class CreateRentalFee < ActiveRecord::Migration[6.0]
  def change
    create_table :rental_fees do |t|
      t.integer :price
      t.references :fee_unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
