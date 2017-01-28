class AddJobcardNumToRepairs < ActiveRecord::Migration[5.0]
  def change
    add_column :repairs, :jobcard_num, :integer
  end
end
