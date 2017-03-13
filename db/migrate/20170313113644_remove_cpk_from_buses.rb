class RemoveCpkFromBuses < ActiveRecord::Migration[5.0]
  def change
  	remove_column :buses, :cpk, :float
  end
end
