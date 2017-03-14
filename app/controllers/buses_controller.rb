class BusesController < ApplicationController
  before_action :set_bus, only: [:show, :edit, :update, :destroy]


  # GET /buses
  # GET /buses.json
  def index
    @buses = Bus.order(:bus_no).includes(:bus_model, :bus_line)

    respond_to do |format|
      format.html
      format.csv { send_data @buses.to_csv, filename: "buses-#{Date.today}.csv" }
    end

  end

  # GET /buses/1
  # GET /buses/1.json
  def show
  end

  def odometer_add
    @bus= Bus.find(params[:id])
    @bus.update(odometer: @bus.odometer + @bus.bus_line.distance)
    @ceo = "Change Engine Oil"
    @cff = "Change Fuel Filter"
    @cof = "Change Oil Filter"
    @ns = "Not Started"
    @cab = "Check/Adjust Brake (Front & Rear)"
    @cac = "Check/Adjust Clutch"
    @cav = "Check/Adjust V-Belt"
    @cae = "Check/Clean Air Cleaner Element"
    @gaf = "Greasing All Fittings"
    @cbf = "Check Battery Fluid"

    if @bus.odometer >= 5000 && @bus.odometer < 15000 && @bus.repairs.where(repairtype: "Preventive", odometer: 5000...14999).first.nil?
      r = Repair.create(bus_id: @bus.id, 
              datestarted: Time.zone.now, repairtype: "Preventive")  
      bus_update(@bus)
      r.jobs.create(jobparticular: @ceo, status: @ns)
      r.jobs.create(jobparticular: @cff, status: @ns)
      r.jobs.create(jobparticular: @cof, status: @ns)
      r.jobs.create(jobparticular: "Change Differential Gear Oil - SAE 140", status: @ns)
      r.jobs.create(jobparticular: "Change Transmission Gear Oil - SAE 90", status: @ns)
      r.jobs.create(jobparticular: @cab, status: @ns)
      r.jobs.create(jobparticular: @gaf, status: @ns)
      r.jobs.create(jobparticular: @cac, status: @ns)
      r.jobs.create(jobparticular: @cav, status: @ns)
      r.jobs.create(jobparticular: @cae, status: @ns)
      r.jobs.create(jobparticular: "Change ATF Oil", status: @ns)
      r.jobs.create(jobparticular: "Change ATF Filter",  status: @ns)
      r.jobs.create(jobparticular: @cbf, status: @ns)

    elsif @bus.odometer >=15000 && @bus.odometer < 25000 && @bus.repairs.where(repairtype: "Preventive", odometer: 15000...24999).first.nil?
      r = Repair.create(bus_id: @bus.id, 
              datestarted: Time.zone.now, repairtype: "Preventive")   
      bus_update(@bus)
      r.jobs.create(jobparticular: @ceo, status: @ns)
      r.jobs.create(jobparticular: @cff, status: @ns)
      r.jobs.create(jobparticular: @cof, status: @ns)
      r.jobs.create(jobparticular: "Repacked All Wheel Hub Bearing (Front & Rear)", status: @ns)
      r.jobs.create(jobparticular: @cab, status: @ns)
      r.jobs.create(jobparticular: @gaf, status: @ns)
      r.jobs.create(jobparticular: @cac, status: @ns)
      r.jobs.create(jobparticular: @cav, status: @ns)
      r.jobs.create(jobparticular: @cae, status: @ns)
      r.jobs.create(jobparticular: "Check/Adjust Valve Clearance", status: @ns)
      r.jobs.create(jobparticular: "Check Retorque Front & Rear Suspension Bolt & Nut", status: @ns)
      r.jobs.create(jobparticular: "Check Up Aircon System", status: @ns)
      r.jobs.create(jobparticular: "Check/Adjust Draglink & Tie Rod End", status: @ns)
      r.jobs.create(jobparticular: @cbf, status: @ns)
      r.jobs.create(jobparticular: "Tune up", status: @ns)

    elsif @bus.odometer >= 25000 && @bus.odometer < 35000 && @bus.repairs.where(repairtype: "Preventive" odometer: 25000...34999).first.nil?
      r = Repair.create(bus_id: @bus.id, 
              datestarted: Time.zone.now, repairtype: "Preventive") 
      bus_update(@bus)
      r.jobs.create(jobparticular: @ceo, status: @ns)
      r.jobs.create(jobparticular: @cff, status: @ns)
      r.jobs.create(jobparticular: @cof, status: @ns)
      r.jobs.create(jobparticular: @cab, status: @ns)
      r.jobs.create(jobparticular: @gaf, status: @ns)
      r.jobs.create(jobparticular: @cac, status: @ns)
      r.jobs.create(jobparticular: @cav, status: @ns)
      r.jobs.create(jobparticular: @cae, status: @ns)
      r.jobs.create(jobparticular: @cbf, status: @ns)
      r.jobs.create(jobparticular: "Check Up Aircon System & General Cleaning", status: @ns)

    elsif @bus.odometer >= 35000 && @bus.odometer < 45000 && @bus.repairs.where(repairtype: "Preventive", odometer: 35000...44999).first.nil?
      r = Repair.create(bus_id: @bus.id, 
              datestarted: Time.zone.now, repairtype: "Preventive") 
      bus_update(@bus)
      r.jobs.create(jobparticular: @ceo, status: @ns)
      r.jobs.create(jobparticular: @cff, status: @ns)
      r.jobs.create(jobparticular: @cof, status: @ns) 
      r.jobs.create(jobparticular: @cab, status: @ns)
      r.jobs.create(jobparticular: @gaf, status: @ns)
      r.jobs.create(jobparticular: @cac, status: @ns)
      r.jobs.create(jobparticular: @cav, status: @ns)
      r.jobs.create(jobparticular: @cae, status: @ns)
      r.jobs.create(jobparticular: @cbf, status: @ns)
      r.jobs.create(jobparticular: "Check/Replace Fuel Water Separator Filter", status: @ns)
      r.jobs.create(jobparticular: "Check Up Aircon System & General Cleaning", status: @ns)

    elsif @bus.odometer >=45000 && @bus.odometer <55000 && @bus.repairs.where(repairtype: "Preventive", odometer: 45000...54999).first.nil?
      r = Repair.create(bus_id: @bus.id, 
              datestarted: Time.zone.now, repairtype: "Preventive")
      bus_update(@bus)
      r.jobs.create(jobparticular: @ceo, status: @ns)
      r.jobs.create(jobparticular: @cff, status: @ns)
      r.jobs.create(jobparticular: @cof, status: @ns) 
      r.jobs.create(jobparticular: @cab, status: @ns)
      r.jobs.create(jobparticular: @gaf, status: @ns)
      r.jobs.create(jobparticular: @cac, status: @ns)
      r.jobs.create(jobparticular: @cav, status: @ns)
      r.jobs.create(jobparticular: @cae, status: @ns)
      r.jobs.create(jobparticular: @cbf, status: @ns)
      r.jobs.create(jobparticular: "Change Differential Gear Oil - SAE 140", status: @ns)
      r.jobs.create(jobparticular: "Change Transmission Gear Oil - SAE 90", status: @ns)
      r.jobs.create(jobparticular: "Repacked All Wheel Hub Bearing (Front & Rear)", status: @ns) 
      r.jobs.create(jobparticular: "Change ATF Oil", status: @ns)
      r.jobs.create(jobparticular: "Change ATF Filter",  status: @ns)
      r.jobs.create(jobparticular: "Check/Adjust Draglink & Tie Rod End", status: @ns)
      r.jobs.create(jobparticular: "Check Up Aircon System & General Cleaning", status: @ns)
 

    elsif @bus.odometer >=55000 && @bus.odometer <65000 && @bus.repairs.where(repairtype: "Preventive", odometer: 55000...64999).first.nil?
      r = Repair.create(bus_id: @bus.id, 
              datestarted: Time.zone.now, repairtype: "Preventive") 
      bus_update(@bus)
      r.jobs.create(jobparticular: @ceo, status: @ns)
      r.jobs.create(jobparticular: @cff, status: @ns)
      r.jobs.create(jobparticular: @cof, status: @ns) 
      r.jobs.create(jobparticular: @cab, status: @ns)
      r.jobs.create(jobparticular: @gaf, status: @ns)
      r.jobs.create(jobparticular: @cac, status: @ns)
      r.jobs.create(jobparticular: @cav, status: @ns)
      r.jobs.create(jobparticular: @cae, status: @ns)
      r.jobs.create(jobparticular: @cbf, status: @ns)
      r.jobs.create(jobparticular: "Check/Adjust Valve Clearance", status: @ns)
      r.jobs.create(jobparticular: "Check Up Aircon System & General Cleaning", status: @ns)


    elsif @bus.odometer >=65000 && @bus.odometer <75000 && @bus.repairs.where(repairtype: "Preventive", odometer: 65000...74999).first.nil?
      r = Repair.create(bus_id: @bus.id, 
              datestarted: Time.zone.now, repairtype: "Preventive")
      bus_update(@bus)
      r.jobs.create(jobparticular: @ceo, status: @ns)
      r.jobs.create(jobparticular: @cff, status: @ns)
      r.jobs.create(jobparticular: @cof, status: @ns) 
      r.jobs.create(jobparticular: @cab, status: @ns)
      r.jobs.create(jobparticular: @gaf, status: @ns)
      r.jobs.create(jobparticular: @cac, status: @ns)
      r.jobs.create(jobparticular: @cbf, status: @ns)
      r.jobs.create(jobparticular: "Check Up Aircon System & General Cleaning 1000", status: @ns)
      r.jobs.create(jobparticular: "Check/Replace Fuel Water Separator Filter", status: @ns)
 
    elsif @bus.odometer >=75000 && @bus.odometer <85000 && @bus.repairs.where(repairtype: "Preventive", odometer: 75000...84999).first.nil?
      r = Repair.create(bus_id: @bus.id, 
              datestarted: Time.zone.now, repairtype: "Preventive")
      bus_update(@bus)
      r.jobs.create(jobparticular: @ceo, status: @ns)
      r.jobs.create(jobparticular: @cff, status: @ns)
      r.jobs.create(jobparticular: @cof, status: @ns) 
      r.jobs.create(jobparticular: @cab, status: @ns)
      r.jobs.create(jobparticular: @gaf, status: @ns)
      r.jobs.create(jobparticular: @cac, status: @ns)
      r.jobs.create(jobparticular: @cav, status: @ns)
      r.jobs.create(jobparticular: @cae, status: @ns)
      r.jobs.create(jobparticular: @cbf, status: @ns)
      r.jobs.create(jobparticular: "Check/Replace Brake Lining (Front & Rear)", status: @ns)
      r.jobs.create(jobparticular: "Change Differential Gear Oil - SAE 140", status: @ns)
      r.jobs.create(jobparticular: "Change Transmission Gear Oil - SAE 90", status: @ns)      
      r.jobs.create(jobparticular: "Repacked All Wheel Hub Bearing (Front & Rear)", status: @ns)      
      r.jobs.create(jobparticular: "Check Up Aircon System & General Cleaning", status: @ns)
      r.jobs.create(jobparticular: "Change ATF Oil", status: @ns)
      r.jobs.create(jobparticular: "Change ATF Filter",  status: @ns)
      r.jobs.create(jobparticular: "Check/Adjust Draglink & Tie Rod End", status: @ns)

    elsif @bus.odometer >=85000 && @bus.odometer <95000 && @bus.repairs.where(repairtype: "Preventive", odometer: 85000...94999).first.nil?
      r = Repair.create(bus_id: @bus.id, 
              datestarted: Time.zone.now, repairtype: "Preventive") 
      bus_update(@bus)
      r.jobs.create(jobparticular: @ceo, status: @ns)
      r.jobs.create(jobparticular: @cff, status: @ns)
      r.jobs.create(jobparticular: @cof, status: @ns) 
      r.jobs.create(jobparticular: @cab, status: @ns)
      r.jobs.create(jobparticular: @gaf, status: @ns)
      r.jobs.create(jobparticular: @cac, status: @ns)
      r.jobs.create(jobparticular: @cav, status: @ns)
      r.jobs.create(jobparticular: @cae, status: @ns)
      r.jobs.create(jobparticular: @cbf, status: @ns)           
      r.jobs.create(jobparticular: "Check Up Aircon System & General Cleaning", status: @ns)


    elsif @bus.odometer >= 95000 && @bus.odometer <105000 &&
      @bus.repairs.where(repairtype: "Preventive", odometer: 95000...104999).first.nil?
      r = Repair.create(bus_id: @bus.id, 
              datestarted: Time.zone.now, repairtype: "Preventive") 
      bus_update(@bus)
      r.jobs.create(jobparticular: @ceo, status: @ns) 
      r.jobs.create(jobparticular: @cff, status: @ns)
      r.jobs.create(jobparticular: @cof, status: @ns) 
      r.jobs.create(jobparticular: @cab, status: @ns)
      r.jobs.create(jobparticular: @gaf, status: @ns)
      r.jobs.create(jobparticular: @cac, status: @ns)
      r.jobs.create(jobparticular: @cae, status: @ns)
      r.jobs.create(jobparticular: @cbf, status: @ns)      
      r.jobs.create(jobparticular: "Check Up Aircon System & General Cleaning", status: @ns)

    elsif @bus.odometer >=105000 &&
      @bus.repairs.where(["repairtype =? and odometer >= ?","Preventive", 105000]).first.nil?
      r = Repair.create(bus_id: @bus.id, 
              datestarted: Time.zone.now, repairtype: "Preventive") 
      bus_update(@bus)
      r.jobs.create(jobparticular: @ceo, status: @ns)
      r.jobs.create(jobparticular: @cff, status: @ns)
      r.jobs.create(jobparticular: @cof, status: @ns) 
      r.jobs.create(jobparticular: @cab, status: @ns)
      r.jobs.create(jobparticular: @gaf, status: @ns)
      r.jobs.create(jobparticular: @cac, status: @ns)
      r.jobs.create(jobparticular: @cav, status: @ns)
      r.jobs.create(jobparticular: "Check/Replace Clutch Lining", status: @ns)
      r.jobs.create(jobparticular: "Check/Replace Release Bearing", status: @ns)
      r.jobs.create(jobparticular: @cae, status: @ns)
      r.jobs.create(jobparticular: "Check/Adjust Valve Clearance", status: @ns)
      r.jobs.create(jobparticular: "Repacked Wheel Hub Bearing (Front & Rear) 5kgs. Grease", status: @ns)
      r.jobs.create(jobparticular: "Check/Adjust Valve Clearance", status: @ns)
      r.jobs.create(jobparticular: @cbf, status: @ns)
      r.jobs.create(jobparticular: "Change Differential Gear Oil - SAE 140", status: @ns)
      r.jobs.create(jobparticular: "Change Transmission Gear Oil - SAE 90", status: @ns)
      r.jobs.create(jobparticular: "Repacked All Wheel Hub Bearing (Front & Rear)", status: @ns) 
      r.jobs.create(jobparticular: "Change ATF Oil", status: @ns)
      r.jobs.create(jobparticular: "Change ATF Filter",  status: @ns)
      r.jobs.create(jobparticular: "Check/Adjust Draglink & Tie Rod End", status: @ns)
      r.jobs.create(jobparticular: "Check Up Aircon System & General Cleaning", status: @ns)
      r.jobs.create(jobparticular: "Check/Replace Air Filter Dyer", status: @ns)
      r.jobs.create(jobparticular: "Change Oil Aircon Compressor", status: @ns)

    end

    respond_to do |format|
      format.js
    end
  end

  def odometer_subtract
    @bus= Bus.find(params[:id])
    @bus.update(odometer: @bus.odometer - @bus.bus_line.distance)

    respond_to do |format|
      format.js
    end
  end

  def import
    begin
      @bus_models = BusModel.all
      @bus_lines = BusLine.all
      Bus.import(params[:file])
      redirect_to buses_url, notice: "Buses imported."
    rescue
        redirect_to buses_url, notice: "Invalid CSV file format."
      end
  end

  # GET /buses/new
  def new
    @bus = Bus.new
  end

  # GET /buses/1/edit
  def edit
  end

  # POST /buses
  # POST /buses.json
  def create
    @bus = Bus.new(bus_params)

    respond_to do |format|
      if @bus.save
        format.html { redirect_to @bus, notice: 'Bus was successfully created.' }
        format.json { render :show, status: :created, location: @bus }
      else
        format.html { render :new }
        format.json { render json: @bus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buses/1
  # PATCH/PUT /buses/1.json
  def update
    respond_to do |format|
      if @bus.update(bus_params)
        format.html { redirect_to @bus, notice: 'Bus was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus }
      else
        format.html { render :edit }
        format.json { render json: @bus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buses/1
  # DELETE /buses/1.json
  def destroy

    begin
        @bus.destroy
      respond_to do |format|
        format.html { redirect_to buses_url, notice: 'Bus was successfully destroyed.' }
        format.json { head :no_content }
      end

    rescue 
      redirect_to buses_url, notice: 'Bus has repair records. Cannot be deleted.'
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus
      @bus = Bus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_params
      params.require(:bus).permit(:avatar, :bus_model_id, :plate_no, :date_purchased, :repair_id, :odometer, :bus_line_id, :cpk, :bus_no, :status, :active)
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
