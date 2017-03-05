class RemoveActiveFromBuses < ActiveRecord::Migration[5.0]
  def change
    remove_column :buses, :active, :boolean
  end
end
