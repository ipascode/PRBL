class ReportController < ApplicationController
	
	def index
		@buses = Bus.all
		@repairs = Repair.all
	end

end
