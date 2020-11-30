class RoomsController < ApplicationController

  def index

  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  def show
    
  end

  private

  def room_params
    params.require(:room).permit(:home_type, :room_type, :member, :bed, :bath, :name, :introduction, :location, :is_tv, :is_kitchen, :is_air, :is_heater, :wifi, :active, :pet, :parking, :breakfast).merge(user_id: current_user.id)
  end

end
