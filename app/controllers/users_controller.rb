class UsersController < ApplicationController
  before_action :authenticate_user!
  def mypage
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
  end
end
