class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
      t.string :lastname
      t.string :firstname
      t.string :middlename

      t.timestamps
    end
  end
end
