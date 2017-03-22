class ReportController < ApplicationController
	
	def index
		@buses = Bus.all
		@repairs = Repair.all
		if(params[:startDate].present? && params[:endDate].present?)
			start_date = Time.zone.parse(params[:startDate])
			end_date = Time.zone.parse(params[:endDate])
			@topjobparticular = Job.datefilter(start_date, end_date.end_of_day).group(:jobparticular).group_by_month(:timefinished, format:  "%b").order("count(jobparticular) desc").limit(10).count
			@cumulative = Job.datefilter(start_date, end_date.end_of_day).group_by_month(:timefinished).sum(:duration_minutes)
			@avg = Job.datefilter(start_date, end_date.end_of_day).group_by_month(:timefinished).average(:duration_minutes)			
			@jpart = Job.group(:jobparticular).average(:duration_minutes)
		else
			@topjobparticular = Job.group(:jobparticular).group_by_month(:timefinished, format:  "%b").order("count(jobparticular) desc").limit(10).count
			@cumulative = Job.group_by_month(:timefinished).sum(:duration_minutes)
			@avg = Job.group_by_month(:timefinished).average(:duration_minutes)
			@jpart = Job.all.group(:jobparticular).average(:duration_minutes)
			@mechanics = Mechanic.includes(:jobs).all		
			# @jparticulars = Hash.new
			# Job.all.group_by(&:jobparticular).each do |job, jobparticular| 
			#   @jparticulars[:jobparticular] = 
			#   products.each do |product| 
			#     (product.color_id ): product.in_stock 
			#   end 
			# end 
		end


		respond_to do |format|
	      format.html
	      format.pdf do
        render pdf: 'Maintenance',
        :template => "report/index.html.erb"
      		end
		end
	end



end
