class RepairsController < ApplicationController
  before_action :set_repair, only: [:show, :edit, :update, :destroy]

  # GET /repairs
  # GET /repairs.json
  def index
    @repairs = Repair.all.includes(:driver, :bus)

    respond_to do |format|
      format.html
      format.csv { send_data @repairs.to_csv, filename: "jobcards-#{Date.today}.csv" }
    end
  end

  def bushistory
    @repair = Repair.includes(jobs: :job_parts).where(bus_id: params[:bn], done: true).limit(10)
    respond_to do |format|
      if @repair.present?
        format.json { render json: @repair, 
                             :include => { :jobs => {
                             :include => { :job_parts => {
                              :include => :part
                             }
                             }}}}
      else
        format.json { render json: 'null'}
      end
    end
  end


  def import
    begin
      Repair.import(params[:file])
      redirect_to repairs_url, notice: "Repairs imported."
    rescue
        redirect_to repairs_url, notice: "Invalid CSV file format."
      end
  end

  # GET /repairs/1
  # GET /repairs/1.json
  def show
  end

  def job_start
    @job= Job.find(params[:id])

    if @job.status == "Repairing"
      @job.update(timefinished: Time.zone.now, status: "Done")
      @job.update(duration: TimeDifference.between(@job.timestarted, @job.timefinished).humanize)
      @repair = Repair.find(@job.repair_id)
        if @repair.jobs.count == @repair.jobs.done.count
          @repair.update(done: true, datefinished: Time.zone.now)
        end

        @bus= Bus.find(@repair.bus_id)
        if @bus.repairs.count == @bus.repairs.done.count 
          @bus.update(status: nil )
        end

    else
      @job.update(timestarted: Time.zone.now, status: "Repairing")
    end

    respond_to do |format|
        format.js
      end
  end

  # GET /repairs/new
  def new
    @repair = Repair.new
    @drivers = Driver.all
    @buses = Bus.all
    @mechanics = Mechanic.all
    @parts = Part.all
    @jobs = Job.all
  end

  # GET /repairs/1/edit
  def edit
    @drivers = Driver.all
    @buses = Bus.all
    @mechanics = Mechanic.all
    @parts = Part.all
    @jobs = Job.all
  end

  # POST /repairs
  # POST /repairs.json
  def create
    @repair = Repair.new(repair_params)

    respond_to do |format|
      if @repair.save
        format.html { redirect_to @repair, notice: 'Repair was successfully created.' }
        format.json { render :show, status: :created, location: @repair }

        @bus= Bus.find(@repair.bus_id)
        @repair.update(odometer: @bus.odometer, datestarted: Time.zone.now)
        #buses status updates to to be repaired    
        bus_update(@bus)

        update_parts(@repair)
        
      else
        format.html { render :new }
        format.json { render json: @repair.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /repairs/1
  # PATCH/PUT /repairs/1.json
  def update
    respond_to do |format|
      if @repair.update(repair_params)
        format.html { redirect_to @repair, notice: 'Repair was successfully updated.' }
        format.json { render :show, status: :ok, location: @repair }
        
         if @repair.jobs.count == @repair.jobs.done.count
          @repair.update(done: true)
        end
        update_parts(@repair)
        @bus= Bus.find(@repair.bus_id)
        bus_update(@bus)

      else
        format.html { render :edit }
        format.json { render json: @repair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repairs/1
  # DELETE /repairs/1.json
  def destroy
    @bus= Bus.find(@repair.bus_id)
    @repair.destroy
    bus_update(@bus)

    respond_to do |format|
      format.html { redirect_to repairs_url, notice: 'Repair was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair
      @repair = Repair.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repair_params
      params.require(:repair).permit(:datestarted, :datefinished, :repairtype, :driver_id, :bus_id, :jobcard_num, :odometer, :done,
        jobs_attributes: [:id, :repair_id, :timestarted, :timefinished, :jobparticular, {:mechanic_ids => []}, :status, :_destroy, 
        job_parts_attributes: [:id, :part_id, :quantity, :cost, :job_id, :_destroy]])
    end

    def update_parts(r)
      r.jobs.each do |job|
            job.job_parts.each do |job_part|
              if job_part != nil
                if job_part.quantity != nil && job_part.cost != nil
                  job_part.update(total: job_part.quantity * job_part.cost)
                  job_part.part.update(last_used: Time.zone.now, price: job_part.cost)
                end
              end
            end
        end
    end


    def bus_update(b)        
        if b.repairs.to_finish.count > 0
            b.update(status: "In Repair" )
        end 

        if b.repairs.count == b.repairs.done.count  
          b.update(status: nil )

        end
    end

end
