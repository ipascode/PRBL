class CreateBusLines < ActiveRecord::Migration[5.0]
  def change
    create_table :bus_lines do |t|
      t.string :linename
      t.float :distance

      t.timestamps
    end
  end
end
