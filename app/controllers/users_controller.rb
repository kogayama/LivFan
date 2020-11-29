class UsersController < ApplicationController

  def top
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
  end
end
