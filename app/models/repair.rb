class Repair < ApplicationRecord
	
	belongs_to :driver
	belongs_to :bus
	has_many :jobs,  inverse_of: :repair #prevents error: jobs repair does not exist 
  	accepts_nested_attributes_for :jobs, reject_if: :all_blank, allow_destroy: true 

  	
end
