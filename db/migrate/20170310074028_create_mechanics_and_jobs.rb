class CreateMechanicsAndJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :mechanics_and_jobs, id: false do |t|
      t.belongs_to :mechanic, index: true
      t.belongs_to :job, index: true   
    end
  end
end
