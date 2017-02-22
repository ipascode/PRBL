class Driver < ApplicationRecord
	has_many :repairs

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    require 'csv'

	def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
     driver_hash = row.to_hash
      driver = Driver.where(lastname: driver_hash["lastname"], firstname: driver_hash["firstname"], middlename: driver_hash["middlename"])

      if driver.count == 1
        driver.first.update_attributes(driver_hash)
      else
        Driver.create! row.to_hash
      end # end if !driver.nil?
    end # end CSV.foreach
  end # end self.import(file)

end
