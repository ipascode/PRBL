class AdminController < ApplicationController
	def manage_users
		@users = User.all
  end

  def show
  end

  def import
  begin
    User.import(params[:file])
    redirect_to admin_manage_users_url, notice: "Users imported."
  rescue
      redirect_to admin_manage_users_url,, notice: "Invalid CSV file format."
    end
  end

  # GET /drivers/new
  def new
    @User = User.new
  end

  # GET /drivers/1/edit
  def edit
  end

  # POST /drivers
  # POST /drivers.json
  def create
    @user =User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user}
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drivers/1
  # PATCH/PUT /drivers/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drivers/1
  # DELETE /drivers/1.json
  def destroy
    begin
      @user.destroy
      respond_to do |format|
        format.html { admin_manage_users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
      
       rescue
        redirect_to admin_manage_users_url, notice: "Usercannot be deleted.."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:lastname, :firstname, :email, :encrypted_password, :position, :role)
    end
end


end
