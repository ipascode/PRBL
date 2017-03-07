class Bus < ApplicationRecord
  belongs_to :bus_model
  has_many :repairs
  belongs_to :bus_line

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :bus_no, :presence => true
  validates :bus_no, :plate_no, uniqueness: { case_sensitive: false }


  scope :in_repair, lambda {where(:status => "In repair")}
  

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      bus_hash = row.to_hash
      bus = Bus.where(bus_no: bus_hash["bus_no"])

      #look for the bus model's brand
      br = BusModel.where(:brand => bus_hash["brand"]).first
         if br == nil
          br = BusModel.create(brand: bus_hash["brand"])
         end
         br_id = br.id

      #look for the bus line
      bl = BusLine.where(linename: bus_hash["linename"]).first
         if bl == nil
          bl = BusLine.create(linename: bus_hash["linename"])
         end
         bl_id = bl.id     


      if bus.count == 1
       bus.first.update_attributes(bus_no: bus_hash['bus_no'], bus_model_id: br_id, bus_line_id: bl_id, plate_no: bus_hash['plate_no'],  date_purchased: bus_hash['date_purchased'], odometer: bus_hash['odometer'], cpk: bus_hash['cpk'], avatar_file_name: bus_hash['avatar_file_name'], status: bus_hash['status'], active: bus_hash['active']) 
      else
        Bus.create(bus_no: bus_hash['bus_no'], bus_model_id: br_id, bus_line_id: bl_id, plate_no: bus_hash['plate_no'],  date_purchased: bus_hash['date_purchased'], odometer: bus_hash['odometer'], cpk: bus_hash['cpk'], avatar_file_name: bus_hash['avatar_file_name'],  status: bus_hash['status'], active: bus_hash['active']) 
      end

    end # end CSV.foreach
  end # end self.import(file)
end


