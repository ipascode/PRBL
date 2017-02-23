class HomeController < ApplicationController

  def index
      @buses = Bus.remain_active
  end


  
end
