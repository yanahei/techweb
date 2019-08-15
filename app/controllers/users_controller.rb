class UsersController < ApplicationController
  def show
    @name = current_user.name
    @address = current_user.address
  end
end
