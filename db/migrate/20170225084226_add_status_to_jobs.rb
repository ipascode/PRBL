class AddStatusToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :status, :string
  end
end
