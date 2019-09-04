class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address])
  end
  
  private
  
  def check_admin
    if user_signed_in?
      if current_user.admin != true
        redirect_to root_path
      end
    end
  end
  
  def is_disabled
    if current_user.status == 'disabled'
      user_session = nil
      flash[:alert] = "アカウントが無効です"
    end
  end
end
