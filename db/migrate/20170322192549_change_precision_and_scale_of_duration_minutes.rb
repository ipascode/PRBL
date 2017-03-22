class ChangePrecisionAndScaleOfDurationMinutes < ActiveRecord::Migration[5.0]
  def change
  	change_column :jobs, :duration_minutes, :decimal, precision: 12, scale: 4
  end
end
