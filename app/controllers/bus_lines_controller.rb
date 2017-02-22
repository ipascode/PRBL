class BusLinesController < ApplicationController
  before_action :set_bus_line, only: [:show, :edit, :update, :destroy]

  # GET /bus_lines
  # GET /bus_lines.json
  def index
    @bus_lines = BusLine.all
  end

 def import
  begin
    BusLine.import(params[:file])
    redirect_to bus_lines_url, notice: "Bus lines imported."
  rescue
      redirect_to bus_lines_url, notice: "Invalid CSV file format."
    end
  end

  # GET /bus_lines/1
  # GET /bus_lines/1.json
  def show
  end

  # GET /bus_lines/new
  def new
    @bus_line = BusLine.new
  end

  # GET /bus_lines/1/edit
  def edit
  end

  # POST /bus_lines
  # POST /bus_lines.json
  def create
    @bus_line = BusLine.new(bus_line_params)

    respond_to do |format|
      if @bus_line.save
        format.html { redirect_to @bus_line, notice: 'Bus line was successfully created.' }
        format.json { render :show, status: :created, location: @bus_line }
      else
        format.html { render :new }
        format.json { render json: @bus_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bus_lines/1
  # PATCH/PUT /bus_lines/1.json
  def update
    respond_to do |format|
      if @bus_line.update(bus_line_params)
        format.html { redirect_to @bus_line, notice: 'Bus line was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus_line }
      else
        format.html { render :edit }
        format.json { render json: @bus_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_lines/1
  # DELETE /bus_lines/1.json
  def destroy
      begin
      @bus_line.destroy
      respond_to do |format|
        format.html { redirect_to bus_lines_url, notice: 'Bus line was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    rescue  
        redirect_to bus_lines_url, notice: 'Bus line has associated records. Remove them first before deleting.'
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_line
      @bus_line = BusLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_line_params
      params.require(:bus_line).permit(:linename, :distance)
    end
end
