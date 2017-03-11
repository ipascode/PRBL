class RemoveMechanicsFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_reference(:jobs, :mechanic, index: true, foreign_key: true)
  end
end
