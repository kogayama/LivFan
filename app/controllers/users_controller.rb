class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def edit
    @user = User.find(params[:id])
    @image = @user.image
  end

  def update
    current_user.update(user_params)
    redirect_to mypage_user_path(current_user)
  end
  
  def show
    @user = User.find(params[:id])
    @id = @user.id
    @nickname = @user.nickname
    @image = @user.image
    @introduction = @user.introduction
    @rooms = @user.rooms
  end

  def mypage
    @user = User.find(params[:id])
  end

  def mybook
    @mybooks = current_user.books
  end

  def be_booked
    @rooms = current_user.rooms
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :image, :introduction)
  end
end
