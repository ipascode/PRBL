class BusLine < ApplicationRecord
	validates :linename, presence: true
	has_many :buses
	require 'csv'

	def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
     busline_hash = row.to_hash
      busline = BusLine.where(id: busline_hash["id"])

      if busline.count == 1
        busline.first.update_attributes(busline_hash)
      else
        BusLine.create! row.to_hash
      end # end if !busline.nil?
    end # end CSV.foreach
  end # end self.import(file)


end
