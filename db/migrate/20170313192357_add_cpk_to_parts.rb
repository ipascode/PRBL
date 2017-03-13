class AddCpkToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :cpk, :float
    add_column :parts, :serial_no, :string
    add_column :parts, :group, :string
  end
end
