class RemoveRepairFromDriver < ActiveRecord::Migration[5.0]
  def change
    remove_reference :drivers, :repair_id, foreign_key: true
  end
end
