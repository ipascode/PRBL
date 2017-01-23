class CreateBusModels < ActiveRecord::Migration[5.0]
  def change
    create_table :bus_models do |t|
      t.string :brand

      t.timestamps
    end
  end
end
