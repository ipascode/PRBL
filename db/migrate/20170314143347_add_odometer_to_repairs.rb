class AddOdometerToRepairs < ActiveRecord::Migration[5.0]
  def change
    add_column :repairs, :odometer, :float
  end
end
