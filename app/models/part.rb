class Part < ApplicationRecord
  belongs_to :BusModel, optional: true
  require 'csv'
  
  def brand
      BusModel.brand
    end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
     part_hash = row.to_hash

      part = Part.where(id: part_hash["id"])
      row['BusModel_id'] = BusModel.find_or_create_by(brand: row['BusModel_id'])

      if part.count == 1
        part.first.update_attributes(part_hash)
      else
        Part.create! row.to_hash
      end # end if !part.nil?
    end # end CSV.foreach
  end # end self.import(file)

end
