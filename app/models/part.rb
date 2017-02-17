class Part < ApplicationRecord
  belongs_to :bus_model, optional: true
  require 'csv'

  def brand
      bus_model.brand
    end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
     part_hash = row.to_hash

      part = Part.where(id: part_hash["id"])
      row['bus_model_id'] = BusModel.find_or_create_by(brand: row['bus_model_id'])

      if part.count == 1
        part.first.update_attributes(part_hash)
      else
        Part.create! row.to_hash
      end # end if !part.nil?
    end # end CSV.foreach
  end # end self.import(file)

end
