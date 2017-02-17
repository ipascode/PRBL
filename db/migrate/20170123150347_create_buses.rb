class CreateBuses < ActiveRecord::Migration[5.0]
  def change
    create_table :buses do |t|
      t.integer :bus_no
      t.references :bus_model, foreign_key: true
      t.string :plate_no
      t.datetime :date_purchased
      t.float :odometer
      t.references :bus_line, foreign_key: true
      t.float :cpk

      t.timestamps
    end
  end
end
