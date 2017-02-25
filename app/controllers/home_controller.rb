class HomeController < ApplicationController

  def index
      @buses = Bus.remain_active
  end

   def job_start
    @job= Job.find(params[:id])
    #@repair = Repair.find(params[@job.repair_id])
    @job.update(timestarted: Time.now)
    #@repair.update(jobs_attributes: [{id: @job.id, timestarted: Time.now}])
    
	    respond_to do |format|
	      format.js
	    end
    end
  
end
