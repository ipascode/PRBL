class CreateRepairs < ActiveRecord::Migration[5.0]
  def change
    create_table :repairs do |t|
      t.datetime :datestarted
      t.datetime :datefinished
      t.string :repairtype
      t.references :Driver, foreign_key: true
      t.references :Bus, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end
