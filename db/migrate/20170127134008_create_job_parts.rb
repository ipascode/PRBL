class CreateJobParts < ActiveRecord::Migration[5.0]
  def change
    create_table :job_parts do |t|
      t.references :part, foreign_key: true
      t.integer :quantity
      t.float :cost
      t.belongs_to :job, foreign_key: true

      t.timestamps
    end
  end
end
