class HomeController < ApplicationController

  def index
      @buses = Bus.in_repair.order(:bus_no).includes(repairs: [:driver, jobs: 
      	[:mechanics, job_parts: 
      		[:part]]]).where('repairs.done = ?', 'False').references(:repairs)

  end

  
end
