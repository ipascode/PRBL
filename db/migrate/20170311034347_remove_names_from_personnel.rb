class RemoveNamesFromPersonnel < ActiveRecord::Migration[5.0]
  def change
  	remove_column :mechanics, :firstname
  	remove_column :mechanics, :middlename
  	remove_column :drivers, :firstname
  	remove_column :drivers, :middlename
  end
end
