class HomeController < ApplicationController

  def index
      @buses = Bus.in_repair

  end

  def exp
      @buses = Bus.in_repair

  end
  
end
