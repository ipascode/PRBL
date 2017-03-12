class Repair < ApplicationRecord

	belongs_to :driver
	belongs_to :bus
	has_many :jobs,  inverse_of: :repair, dependent: :destroy #prevents error: jobs repair does not exist 
  accepts_nested_attributes_for :jobs, reject_if: :all_blank, allow_destroy: true 

  	scope :to_finish, lambda { where(:done => false)}
    scope :done, lambda { where(:done => true)}
    scope :part_history, lambda { |b| joins(:jobs =>:job_parts).where('job_parts.part_id'=> b) }
  
    validates :bus_id, presence: true

  require 'csv'

   def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |product|
      csv << product.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
     @errors = []
    CSV.foreach(file.path, headers: true, :header_converters=> lambda {|f| f.strip}, :converters=> lambda {|f| f ? f.strip : nil}) do |row|
      begin
        repair_hash = row.to_hash
        repair = Repair.where(jobcard_num: repair_hash["Job Card Number"])
       

        #look for the bus
        br = Bus.where(:bus_no => repair_hash["Bus Number"]).first
           if br == nil
            @errors << "Bus #{repair_hash["Bus Number"]} does not exist."
           end

       # look for driver
       dr = Driver.where(lastname: repair_hash["Driver"]).first
           if dr == nil
            dr = Driver.create(lastname: repair_hash["Driver"])
           end

       #look for parts
      if repair_hash["Parts and Materials Used"] != "N/A"
        pr = Part.where(partname: repair_hash["Parts and Materials Used"]).first
        if pr == nil
          pr = Part.create(partname: repair_hash["Parts and Materials Used"], unit: repair_hash['Unit'])
        end
      end

          if repair.count == 1
            if repair_hash.key?("Driver")
          	repair.first.update_attributes(driver_id: dr.id, bus_id: br.id, 
          		jobcard_num: repair_hash['Job Card Number'],
              done: repair_hash['Done'],
              datestarted: Time.zone.strptime(repair_hash['Date and Time Started'], '%m/%d/%Y %H:%M%p'),
              datefinished: Time.zone.strptime(repair_hash['Date and Time Finished'], '%m/%d/%Y %H:%M%p'))
            end
              rj = repair.first.jobs.create(jobparticular: repair_hash['Repairs Done'])
              rj.job_parts.create(part_id: pr.id, quantity: repair_hash['Quantity'])
              mecha = repair_hash["Assigned Mechanic"].split("-")
              mecha.each do |m|
                mc = Mechanic.where(lastname: m).first
                  if mc == nil
                    mc = Mechanic.create(lastname: m)
                  end
                rj.mechanics << mc  
              end
          else
          Repair.create(driver_id: dr.id, bus_id: br.id, 
          		jobcard_num: repair_hash['Job Card Number'],
          		done: repair_hash['Done'],
          		datestarted: Time.zone.strptime(repair_hash['Date and Time Started'], '%m/%d/%Y %H:%M%p'),
          		datefinished: Time.zone.strptime(repair_hash['Date and Time Finished'], '%m/%d/%Y %H:%M%p'))	
      end
      rescue

      end
    end # end CSV.foreach
  end # end self.import(file)
  
end
