class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  private
  
  def check_admin
    if user_signed_in?
      if current_user.try!(:admin?)
        redirect_to root_path
      end
    end
  end
end
