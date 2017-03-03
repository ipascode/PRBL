class ChangeBusLineDistance < ActiveRecord::Migration[5.0]
  def change
  	change_column :bus_lines, :distance, :float, :default => 0
  end
end
