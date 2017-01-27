class AddBusNoToBuses < ActiveRecord::Migration[5.0]
  def change
    add_column :buses, :bus_no, :integer
  end
end
