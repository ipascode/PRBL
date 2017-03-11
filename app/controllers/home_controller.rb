class HomeController < ApplicationController

  def index
      @buses = Bus.in_repair.includes(repairs: [:jobs, :driver]) 

  end

  
end
