class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.datetime :timestarted
      t.datetime :timefinished
      t.float :duration
      t.string :jobparticular
      t.references :mechanic, foreign_key: true
      t.boolean :done
      t.belongs_to :repair, foreign_key: true

      t.timestamps
    end
  end
end
