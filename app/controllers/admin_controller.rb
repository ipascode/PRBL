class AdminController < ApplicationController
	def manage_users
		@users = User.all
  end

  def destroy
  @user.destroy!

  respond_to do |format|
    format.json { respond_to_destroy(:ajax) }
    format.xml  { head :ok }
    format.html { respond_to_destroy(:html) }      
  end
end
end
