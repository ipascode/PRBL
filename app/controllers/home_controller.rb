class HomeController < ApplicationController

  def index
      @repairs = Repair.not_done
      @buses = Bus.remain_active
      @jobs = Job.all
  end


  
end
