class HomeController < ApplicationController

  def index
      @repairs = Repair.all
      @buses = Bus.all
  end
  
end
