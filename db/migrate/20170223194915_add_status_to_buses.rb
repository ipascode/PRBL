class AddStatusToBuses < ActiveRecord::Migration[5.0]
  def change
    add_column :buses, :status, :string
  end
end
