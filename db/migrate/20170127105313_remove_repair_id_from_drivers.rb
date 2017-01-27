class RemoveRepairIdFromDrivers < ActiveRecord::Migration[5.0]
  def change
    remove_column :drivers, :Repair_id, :integer
  end
end
