class CreateRepairs < ActiveRecord::Migration[5.0]
  def change
    create_table :repairs do |t|
      t.datetime :datestarted
      t.datetime :datefinished
      t.string :repairtype
      t.references :driver, foreign_key: true
      t.references :bus, foreign_key: true
      t.string :location
      t.integer :jobcard_num

      t.timestamps
    end
  end
end
