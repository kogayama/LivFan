class RoomsController < ApplicationController

  before_action :set_room, only: [:edit, :show, :info, :facility, :image_post]

  def index

  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to info_room_path(@room)
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

  def info
  end

  def facility
  end

  def image_post
  end

  private

  def room_params
    params.require(:room).permit(:home_type, :room_type, :member, :price, :bed, :bath, :name, :introduction, :location, :is_tv, :is_kitchen, :is_air, :is_heater, :wifi, :active, :pet, :parking, :breakfast).merge(user_id: current_user.id)
  end

  def set_room
    @room = Room.find(params[:id])
  end

end
