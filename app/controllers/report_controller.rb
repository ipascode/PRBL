class ReportController < ApplicationController
	
	def index
		@buses = Bus.all
		@repairs = Repair.all
		if(params[:startDate].present? && params[:endDate].present?)
			start_date = Time.zone.parse(params[:startDate])
			end_date = Time.zone.parse(params[:endDate])

			#job particular frequency
			@topjobparticular = Job.done.datefilter(start_date, end_date.end_of_day).group(:jobparticular).group_by_month(:timefinished, format:  "%b").order("count(jobparticular) desc").limit(10).count
			
			#line chart repair average
			@cumulative = Job.done.datefilter(start_date, end_date.end_of_day).group_by_month(:timefinished).sum(:duration_minutes)
			@avg = Job.done.datefilter(start_date, end_date.end_of_day).group_by_month(:timefinished).average(:duration_minutes)			
			@jpart = Job.done.group(:jobparticular).average(:duration_minutes)

			#mechanics performance
			@mechanics = Mechanic.includes(:jobs).where('jobs.status = ? ', "Done").references(:jobs)	

			#for part cost pie chart
			@partcost = JobPart.includes(:part, :job)
			.where('jobs.status = ? AND jobs.timefinished >= ? AND jobs.timefinished <= ?','Done', start_date, end_date.end_of_day)
			.group(:partname).order("sum(total) desc").limit(5).sum(:total)

			#parts total cost
			@totalspentonparts = JobPart.includes(:job)
			.where('jobs.status = ? AND jobs.timefinished >= ? AND jobs.timefinished <= ?','Done', start_date, end_date.end_of_day)
			.sum(:total)

			#parts cost deviation report
			@deviatedpart = Part.includes(job_parts: [:job])
			.where('jobs.status = ? AND jobs.timefinished >= ? AND jobs.timefinished <= ?','Done', start_date, end_date.end_of_day)
			.references(:jobs)

			
			#tires cpk
			@tires = Part.tire.includes(:parts_tire, :bus_model, job_parts: [:job])
			.where('jobs.status = ? AND jobs.timefinished >= ? AND jobs.timefinished <= ?', "Done", start_date, end_date.end_of_day)
			.references(:jobs).group(:bus_model_id)
			
		else
			
			#start_date = Time.zone.parse(DateTime.days_ago(6))
			#end_date = Time.zone.parse(DateTime.now)
			#job particular frequency
			@topjobparticular = Job.done.group(:jobparticular).group_by_day(:timefinished, format:  "%x - %a").order("count(jobparticular) desc").limit(10).count
			
			#line chart repair average
			@avgchangeengineoil = Job.done.where("jobparticular = ?", "Change Engine Oil").group_by_day(:timefinished).average(:duration_minutes)
			@avgchangefuelfilter = Job.done.where("jobparticular = ?", "Change Fuel Filter").group_by_day(:timefinished).average(:duration_minutes)
			@avgchangeoilfilter = Job.done.where("jobparticular = ?", "Change Oil Filter").group_by_day(:timefinished).average(:duration_minutes)
			@avgcheckbattfluid = Job.done.where("jobparticular = ?", "Check Battery Fluid").group_by_day(:timefinished).average(:duration_minutes)
			#mechanics performance
			@jpart = Job.done.group(:jobparticular).average(:duration_minutes)
			@mechanics = Mechanic.includes(:jobs).where('jobs.status = ? ', "Done").references(:jobs)		

			#for part cost pie chart
			@partcost = JobPart.includes(:part, :job).where('jobs.status = ? ', "Done").group(:partname).order("sum(total) desc").limit(10).sum(:total)
			@totalspentonparts = JobPart.includes(:job).where('jobs.status = ? ', "Done").sum(:total)

			#parts cost deviation report
			@deviatedpart = Part.includes(job_parts: [:job]).where('jobs.status = ? ', "Done").references(:jobs)

			#tires cpk
			@tires = Part.tire.includes(:parts_tire, :bus_model, job_parts: [:job]).where('jobs.status = ?', "Done").references(:jobs).group(:bus_model_id)

			respond_to do |format|
		      format.html
		      format.pdf do
	        render pdf: 'Maintenance',
	         :template => "report/index.pdf.html.erb",
	         javascript_delay: 2000
	      		end
			end
		end
	end



end
