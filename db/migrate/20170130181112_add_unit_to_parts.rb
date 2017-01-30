class AddUnitToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :unit, :string
  end
end
