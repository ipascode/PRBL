class ReportController < ApplicationController
	
	def index
		@buses = Bus.all
		@repairs = Repair.all

		respond_to do |format|
	      format.html
	      format.pdf do
        render pdf: 'Maintenance',
        :template => "report/index.html.erb"
      		end
		end
	end



end
