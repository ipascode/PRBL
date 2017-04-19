class ChangeIndexNumber < ActiveRecord::Migration[5.0]
  def change
  	change_column :parts, :index_number, :string
  end
end
