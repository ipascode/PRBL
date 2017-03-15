class ChangeDuration < ActiveRecord::Migration[5.0]
  def change
  	change_column :jobs, :duration, :string
  end
end
