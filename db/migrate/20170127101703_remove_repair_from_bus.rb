class RemoveRepairFromBus < ActiveRecord::Migration[5.0]
  def change
    remove_reference :buses, :Repair, foreign_key: true
  end
end
