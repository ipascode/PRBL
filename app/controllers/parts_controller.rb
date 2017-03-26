class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]

  # GET /parts
  # GET /parts.json
  def index
    @parts = Part.all.includes(:bus_model)
    respond_to do |format|
      format.html
      format.csv { send_data @parts.to_csv, filename: "parts-#{Date.today}.csv" }
    end
  end

  def import
  #begin
    @bus_models = BusModel.all
    Part.import(params[:file])
    redirect_to parts_url, notice: "Parts imported."
  #rescue
   #   redirect_to parts_url, notice: "Invalid CSV file format."
   # end
  end

  # GET /parts/1
  # GET /parts/1.json
  def show
    @repairs = Repair.part_history(params[:id])

  end

  # GET /parts/new
  def new
    @part = Part.new
    @bus_models = BusModel.all
    @buses = Bus.where('bus_model_id = ?', params[:bus_model_id])
    @part.build_parts_tire
  end

  # GET /parts/1/edit
  def edit
    @buses = Bus.all
  end

  # POST /parts
  # POST /parts.json
  def create
    @part = Part.new(part_params)
  
    respond_to do |format|
      if @part.save
        format.html { redirect_to @part, notice: 'Part was successfully created.' }
        format.json { render :show, status: :created, location: @part }
      else
        format.html { render :new }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parts/1
  # PATCH/PUT /parts/1.json
  def update
    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to @part, notice: 'Part was successfully updated.' }
        format.json { render :show, status: :ok, location: @part }
      else
        format.html { render :edit }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1
  # DELETE /parts/1.json
  def destroy
    begin
    @part.destroy
    respond_to do |format|
      format.html { redirect_to parts_url, notice: 'Part was successfully destroyed.' }
      format.json { head :no_content }
    end

    rescue
      redirect_to parts_url, notice: 'Part used in job card. Cannot be deleted.'
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_params
      params.require(:part).permit(:partname, :part_number, :bus_model_id, :index_number, :price, :lifespan, :group, :last_used,
         parts_tire_attributes: [:id, :part_id, :bus_id, :serial_no, :odometer, :cpk, :_destroy])
    end

end
