class HomeController < ApplicationController

  def index
      @repairs = Repair.all
      @buses = Bus.all
      @jobs = Job.all
  end


  
end
