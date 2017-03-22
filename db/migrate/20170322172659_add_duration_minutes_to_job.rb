class AddDurationMinutesToJob < ActiveRecord::Migration[5.0]
  def change
  	add_column :jobs, :duration_minutes, :decimal
  end
end
