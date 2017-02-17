class Part < ApplicationRecord
  belongs_to :bus_model, optional: true
  require 'csv'

  def brand
      bus_model.brand
    end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

       part = where(id: row["id"]).first_or_create!(row.to_hasparts.bus_models.where(name: row['brand']).first_or_create!(row.to_hash))

    end # end CSV.foreach
  end # end self.import(file)

end
