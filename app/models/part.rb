class Part < ApplicationRecord
  belongs_to :bus_model, optional: true, :foreign_key => "bus_model_id"
  delegate :brand, :to => :bus_model
  require 'csv'


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      part_hash = row.to_hash
      part = Part.where(partname: part_hash["partname"], )
      br_id = nil

      if row['brand'] != nil 
         br = BusModel.where(:brand => part_hash["brand"]).first
         if br == nil
          br = BusModel.create(brand: part_hash["brand"])
         end
         br_id = br.id
     
      end 


      if part.count == 1
       part.first.update_attributes(partname: part_hash['partname'], part_number: part_hash['part_number'], unit: part_hash['unit'], index_number: part_hash['index_number'], price: part_hash['price'], lifespan: part_hash['lifespan'], bus_model_id: br_id) 
      
      else
        Part.create(partname: part_hash['partname'], part_number: part_hash['part_number'], unit: part_hash['unit'], index_number: part_hash['index_number'], price: part_hash['price'], lifespan: part_hash['lifespan'], bus_model_id: br_id) 
      end

    end # end CSV.foreach
  end # end self.import(file)

end
