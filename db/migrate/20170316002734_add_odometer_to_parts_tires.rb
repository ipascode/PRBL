class AddOdometerToPartsTires < ActiveRecord::Migration[5.0]
  def change
    add_column :parts_tires, :odometer, :float, default: 0
  end
end
