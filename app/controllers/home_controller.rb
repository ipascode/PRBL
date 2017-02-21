class HomeController < ApplicationController

  def index
      @repairs = Repair.all
      @buses = Bus.all
      @drivers = Driver.all
      @jobs = Job.all
  end
  
end
