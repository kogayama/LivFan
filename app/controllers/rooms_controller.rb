class RoomsController < ApplicationController

  before_action :set_room, only: [:edit, :update, :show, :info, :facility, :image_post]

  def index
    @rooms = current_user.rooms
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
    if @room.update(room_params)
      flash[:notice] = "保存しました"
    else
      flash[:alert] = "間違いがあります"
    end
    redirect_back(fallback_location: request.referer)
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
    @room_images = @room.room_images
  end

  private

  def room_params
    params.require(:room).permit(:home_type, :room_type, :member, :price, :bed, :bath, :name, :introduction, :location, :is_tv, :is_kitchen, :is_air, :is_heater, :wifi, :done, :pet, :parking, :breakfast).merge(user_id: current_user.id)
  end

  def set_room
    @room = Room.find(params[:id])
  end

end
