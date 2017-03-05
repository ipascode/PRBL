class Driver < ApplicationRecord
	has_many :repairs

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :lastname, :presence => true


  require 'csv'

  def name
    "#{firstname[0,1]}. #{lastname}"
  end

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

  def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |product|
      csv << product.attributes.values_at(*column_names)
    end
  end
end

end
