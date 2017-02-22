class BusModel < ApplicationRecord
	has_many :buses, dependent: :destroy
  has_many :parts
  accepts_nested_attributes_for :buses
    require 'csv'

	def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
     busmodel_hash = row.to_hash
      busmodel = BusModel.where(brand: busmodel_hash["brand"])

      if busmodel.count == 1
        busmodel.first.update_attributes(busmodel_hash)
      else
        BusModel.create! row.to_hash
      end # end if !busmodel.nil?
    end # end CSV.foreach
  end # end self.import(file)

end
