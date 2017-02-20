class AddReferences < ActiveRecord::Migration[5.0]
  def change

  	change_table :repairs do |t|
  	  t.references :driver, foreign_key: true
      t.references :bus, foreign_key: true
  	end

  end
end
