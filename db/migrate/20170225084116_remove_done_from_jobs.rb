class RemoveDoneFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :done, :boolean
  end
end
