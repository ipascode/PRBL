class AddTotalToJobParts < ActiveRecord::Migration[5.0]
  def change
    add_column :job_parts, :total, :float
  end
end
