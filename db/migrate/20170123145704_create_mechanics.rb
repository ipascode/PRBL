class CreateMechanics < ActiveRecord::Migration[5.0]
  def change
    create_table :mechanics do |t|
      t.string :lastname
      t.string :firstname
      t.string :middlename
      t.string :position
      t.string :skills
      t.integer :shift

      t.timestamps
    end
  end
end
