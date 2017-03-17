class CreatePartsTires < ActiveRecord::Migration[5.0]
  def change
    create_table :parts_tires do |t|
      t.references :part, foreign_key: true
      t.references :bus, foreign_key: true
      t.string :serial_no
      t.float :cpk

      t.timestamps
    end
  end
end
