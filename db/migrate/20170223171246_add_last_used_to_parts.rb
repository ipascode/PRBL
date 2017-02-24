class AddLastUsedToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :last_used, :datetime
  end
end
