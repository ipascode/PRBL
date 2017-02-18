class Part < ApplicationRecord
  belongs_to :bus_model, optional: true
  require 'csv'


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      part_hash = row.to_hash
      part = Part.where(id: part_hash["id"])

      if part.count == 1
       part.first.update_attributes(part_hash)
      else
        Part.create! row.to_hash
     end  
    end # end CSV.foreach
  end # end self.import(file)

end
