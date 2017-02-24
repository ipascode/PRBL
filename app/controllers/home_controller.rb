class HomeController < ApplicationController

  def index
<<<<<<< HEAD
      @repairs = Repair.all
      @buses = Bus.all
      @drivers = Driver.all
      @jobs = Job.all
      @buses = Bus.remain_active

  end
  
end
