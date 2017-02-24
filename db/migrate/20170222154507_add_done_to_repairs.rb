class AddDoneToRepairs < ActiveRecord::Migration[5.0]
  def change
    add_column :repairs, :done, :boolean, default: false
  end
end
