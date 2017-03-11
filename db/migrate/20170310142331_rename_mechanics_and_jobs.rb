class RenameMechanicsAndJobs < ActiveRecord::Migration[5.0]
  def change
  	rename_table :mechanics_and_jobs, :jobs_mechanics
  end
end
