class UsersController < ApplicationController
  def show
    @name = current_user.name
    @address = current_user.address
    @favposts = current_user.favposts
  end
  
end
