class BusesController < ApplicationController
  before_action :set_bus, only: [:show, :edit, :update, :destroy]

  # GET /buses
  # GET /buses.json
  def index
    @buses = Bus.order(:bus_no)
  end

  # GET /buses/1
  # GET /buses/1.json
  def show
  end

  def import
    #begin
      @bus_models = BusModel.all
      @bus_lines = BusLine.all
      Bus.import(params[:file])
      redirect_to buses_url, notice: "Buses imported."
    #rescue
    #    redirect_to buses_url, notice: "Invalid CSV file format."
    #  end
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
end
