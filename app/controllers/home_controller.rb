class HomeController < ApplicationController

  def index
      @repairs = Repair.all
      @buses = Bus.remain_active
      @jobs = Job.all
  end


  
end
