class ReportController < ApplicationController
	
	def index
		@buses = Bus.all
		@repairs = Repair.all
		if(params[:startDate].present? && params[:endDate].present?)
			start_date = Time.zone.parse(params[:startDate])
			end_date = Time.zone.parse(params[:endDate])
			@topjobparticular = Job.done.datefilter(start_date, end_date.end_of_day).group(:jobparticular).group_by_month(:timefinished, format:  "%b").order("count(jobparticular) desc").limit(10).count
			@cumulative = Job.done.datefilter(start_date, end_date.end_of_day).group_by_month(:timefinished).sum(:duration_minutes)
			@avg = Job.done.datefilter(start_date, end_date.end_of_day).group_by_month(:timefinished).average(:duration_minutes)			
			@jpart = Job.done.group(:jobparticular).average(:duration_minutes)
			@mechanics = Mechanic.includes(:jobs).where('jobs.status = ? ', "Done").references(:jobs)	

			#for part cost pie chart
			@partcost = JobPart.includes(:part, :job)
			.where('jobs.status = ? AND jobs.timefinished >= ? AND jobs.timefinished <= ?','Done', start_date, end_date.end_of_day)
			.group(:partname).order("sum(total) desc").limit(5).sum(:total)

			@totalspentonparts = JobPart.includes(:job)
			.where('jobs.status = ? AND jobs.timefinished >= ? AND jobs.timefinished <= ?','Done', start_date, end_date.end_of_day)
			.sum(:total)

			#parts cost deviation report
			@deviatedpart = Part.includes(job_parts: [:job])
			.where('jobs.status = ? AND jobs.timefinished >= ? AND jobs.timefinished <= ?','Done', start_date, end_date.end_of_day)
			.references(:jobs)
			
		else
			@topjobparticular = Job.done.group(:jobparticular).group_by_month(:timefinished, format:  "%b").order("count(jobparticular) desc").limit(10).count
			@cumulative = Job.done.group_by_month(:timefinished).sum(:duration_minutes)
			@avg = Job.done.group_by_month(:timefinished).average(:duration_minutes)
			@jpart = Job.done.all.group(:jobparticular).average(:duration_minutes)
			@mechanics = Mechanic.includes(:jobs).where('jobs.status = ? ', "Done").references(:jobs)		

			#for part cost pie chart
			@partcost = JobPart.includes(:part, :job).where('jobs.status = ? ', "Done").group(:partname).order("sum(total) desc").limit(5).sum(:total)
			@totalspentonparts = JobPart.includes(:job).where('jobs.status = ? ', "Done").sum(:total)

			#parts cost deviation report
			@deviatedpart = Part.includes(job_parts: [:job]).where('jobs.status = ? ', "Done").references(:jobs)


			respond_to do |format|
		      format.html
		      format.pdf do
	        render pdf: 'Maintenance',
	        :template => "report/index.html.erb"
	      		end
			end
		end
	end



end
