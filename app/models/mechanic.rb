class Mechanic < ApplicationRecord
	has_and_belongs_to_many :jobs
	
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, :default_url => ":style/avatar-placeholder.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :lastname, :presence => true
  	require 'csv'


	def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
     mechanic_hash = row.to_hash
      mechanic = Mechanic.where(lastname: mechanic_hash["lastname"])

      if mechanic.count == 1
       mechanic.first.update_attributes(mechanic_hash)
      else
        Mechanic.create! row.to_hash
      end # end if !mechanic.nil?
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
