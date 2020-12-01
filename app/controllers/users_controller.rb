class UsersController < ApplicationController
  before_action :authenticate_user!
  def mypage
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
  end


  def mybook
    @mybooks = current_user.books
  end

  def be_booked
    @rooms = current_user.rooms
  end
end
