class Repair < ApplicationRecord
	
	belongs_to :driver
	belongs_to :bus
	has_many :jobs,  inverse_of: :repair #prevents error: jobs repair does not exist 
  accepts_nested_attributes_for :jobs, reject_if: :all_blank, allow_destroy: true 

  	scope :to_finish, lambda { where(:done => false)}
    scope :done, lambda { where(:done => true)}
  	#scope :bus_repairs, lambda { |b| where(:bus_id => b) }

  	require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      repair_hash = row.to_hash
      repair = Repair.where(jobcard_num: repair_hash["Job Card Number"])
     

      #look for the bus line
      bl = BusLine.where(linename: repair_hash["Line"]).first
         if bl == nil
          bl = BusLine.create(linename: repair_hash["Line"])
         end   


         #look for the bus
      br = Bus.where(:bus_no => repair_hash["Bus Number"]).first
         if br == nil
          br = Bus.create(bus_no: repair_hash["Bus Number"], bus_model_id: 1, bus_line_id: bl.id)
         end

     # look for driver
     dr = Driver.where(lastname: repair_hash["Driver"]).first
         if dr == nil
          dr = Driver.create(lastname: repair_hash["Driver"])
         end

     #look for mechanic
     mc = Mechanic.where(lastname: repair_hash["Assigned Mechanic"]).first
         if mc == nil
          mc = Mechanic.create(lastname: repair_hash["Assigned Mechanic"])
         end

     #look for parts
     pr = Part.where(partname: repair_hash["Parts and Materials Used"]).first
         if pr == nil
          pr = Part.create(partname: repair_hash["Parts and Materials Used"], unit: repair_hash['Unit'])
         end
      
       
        if repair.count == 1
        	repair.fist.update_attributes(driver_id: dr.id, bus_id: br.id, 
        		jobcard_num: repair_hash['Job Card Number'],
        		done: repair_hash['Done'],
        		datestarted: repair_hash['Date and Time Started'],
        		datefinished: repair_hash['Date and Time Finished'],
        		jobs_attributes: [mechanic_id: repair_hash["Assigned Mechanic"], 
        		jobparticular: repair_hash['Repairs Done'], done: repair_hash['Done'],  
        		job_parts_attributes: [part_id: pr.id, quantity: repair_hash['Quantity']]])
        		

        else
        Repair.create(driver_id: dr.id, bus_id: br.id, 
        		jobcard_num: repair_hash['Job Card Number'],
        		done: repair_hash['Done'],
        		datestarted: repair_hash['Date and Time Started'],
        		datefinished: repair_hash['Date and Time Finished'],
        		jobs_attributes: [{mechanic_id: repair_hash["Assigned Mechanic"], 
        		jobparticular: repair_hash['Repairs Done'], done: repair_hash['Done'],  
        		job_parts_attributes: [{part_id: pr.id, quantity: repair_hash['Quantity']}]}])
        		
    end


    end # end CSV.foreach
  end # end self.import(file)
  
end
