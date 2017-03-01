class ChangeTableColumns < ActiveRecord::Migration[5.0]
  def change
  	change_column :bus_lines, :linename, :string, :null => false
  	change_column :bus_models, :brand, :string, :null => false
  	change_column :buses, :bus_no, :string, :null => false, :unique => true
  	change_column :drivers, :lastname, :string, :null => false
  	change_column :mechanics, :lastname, :string, :null => false
  	change_column :jobs, :jobparticular, :string, :null => false
  	change_column :parts, :partname, :string, :null => false
  	change_column :parts, :price, :string, :default => 0
  	change_column :buses, :odometer, :float, :default => 0
  end
end
