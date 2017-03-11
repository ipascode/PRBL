class RemoveLocationFromRepair < ActiveRecord::Migration[5.0]
  def change
  	remove_column :repairs, :location, :string
  end
end
