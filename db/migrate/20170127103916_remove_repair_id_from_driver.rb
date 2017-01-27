class RemoveRepairIdFromDriver < ActiveRecord::Migration[5.0]
  def change
    remove_reference :drivers, :Repair_id, foreign_key: true
  end
end
