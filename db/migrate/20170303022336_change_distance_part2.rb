class ChangeDistancePart2 < ActiveRecord::Migration[5.0]
  def change
  	change_column :bus_lines, :distance, :float, :default => 0, :scale => 2
  end
end
