class BusModel < ApplicationRecord
	has_many :buses, dependent: :destroy
    has_many :parts
    require 'csv'

	def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
     busmodel_hash = row.to_hash
      busmodel = BusModel.where(id: busmodel_hash["id"])

      if busmodel.count == 1
        busmodel.first.update_attributes(busmodel_hash)
      else
        BusModel.create! row.to_hash
      end # end if !busmodel.nil?
    end # end CSV.foreach
  end # end self.import(file)
end
