class ApplicationController < ActionController::Base
before_action :authenticate_user!
  protect_from_forgery with: :exception


  rescue_from CanCan::AccessDenied do |exception|
   flash[:error] = exception.message
   redirect_to root_url
    end
 
 protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
  end	

end
