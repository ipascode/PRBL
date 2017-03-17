class RemoveOdometerFromParts < ActiveRecord::Migration[5.0]
  def change
    remove_column :parts, :cpk, :float
    remove_column :parts, :serial_no, :string
  end
end
