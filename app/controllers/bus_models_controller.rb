class BusModelsController < ApplicationController
  before_action :set_bus_model, only: [:show, :edit, :update, :destroy]

  # GET /bus_models
  # GET /bus_models.json
  def index
    @bus_models = BusModel.all
  end

  # GET /bus_models/1
  # GET /bus_models/1.json
  def show
  end

  # GET /bus_models/new
  def new
    @bus_model = BusModel.new
  end

  # GET /bus_models/1/edit
  def edit
  end

  # POST /bus_models
  # POST /bus_models.json
  def create
    @bus_model = BusModel.new(bus_model_params)

    respond_to do |format|
      if @bus_model.save
        format.html { redirect_to @bus_model, notice: 'Bus model was successfully created.' }
        format.json { render :show, status: :created, location: @bus_model }
      else
        format.html { render :new }
        format.json { render json: @bus_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bus_models/1
  # PATCH/PUT /bus_models/1.json
  def update
    respond_to do |format|
      if @bus_model.update(bus_model_params)
        format.html { redirect_to @bus_model, notice: 'Bus model was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus_model }
      else
        format.html { render :edit }
        format.json { render json: @bus_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_models/1
  # DELETE /bus_models/1.json
  def destroy
    @bus_model.destroy
    respond_to do |format|
      format.html { redirect_to bus_models_url, notice: 'Bus model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_model
      @bus_model = BusModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_model_params
      params.require(:bus_model).permit(:brand)
    end
end
