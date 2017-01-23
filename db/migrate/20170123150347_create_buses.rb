class CreateBuses < ActiveRecord::Migration[5.0]
  def change
    create_table :buses do |t|
      t.references :BusModel, foreign_key: true
      t.string :plate_no
      t.datetime :date_purchased
      t.references :Repair, foreign_key: true
      t.float :odometer
      t.references :BusLine, foreign_key: true
      t.float :cpk

      t.timestamps
    end
  end
end
