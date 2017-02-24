class AddActiveToBuses < ActiveRecord::Migration[5.0]
  def change
    add_column :buses, :active, :boolean, default: true
  end
end
