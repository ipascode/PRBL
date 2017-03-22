class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource


  def index
		@users = User.all
  end

  def import
  begin
    User.import(params[:file])
    redirect_to users_url, notice: "Users imported."
  rescue
      redirect_to users_url, notice: "Invalid CSV file format."
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user =User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :index, status: :created, location: @user}
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show    
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    begin
      @user.destroy
      respond_to do |format|
        format.html { users_url notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
      
       rescue
        redirect_to users_url, notice: "User cannot be deleted.."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:lastname, :firstname, :email, :password, :password_confirmation, :encrypted_password, :position, :role)
    end


end
