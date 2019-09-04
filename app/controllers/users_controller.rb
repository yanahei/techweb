class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:new, :create]
  
  def show
    @name = current_user.name
    @address = current_user.address
    @favposts = current_user.favposts
  end
  
  def edit
  end
  
  def update
    current_user.update(update_params)
  end
  
  private
  def update_params
    params.require(:user).permit(:name, :address)
  end
end
