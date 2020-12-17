class RoomsController < ApplicationController

  before_action :set_room, only: [:edit, :update, :show, :info, :facility, :image_post, :pickup, :check]

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
    @room_images = @room.room_images
    @guest_reviews = @room.guest_reviews
  end

  def info
  end

  def facility
  end

  def image_post
    @room_images = @room.room_images
  end

  def pickup
    today = Date.today
    books = @room.books.where("start_date >= ? OR end_date >= ?", today, today)
    render json: books
  end

  def check
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    info = {overlap: is_overlap(start_date, end_date, @room)}
    render json: info
  end
  
  private

  def is_overlap(start_date, end_date, room)
    exist = room.books.where(['start_date > ? AND end_date < ?', start_date, end_date])
    if exist.count > 0
      return true
    else
      return false
    end
  end

  def room_params
    params.require(:room).permit(:home_type, :room_type, :member, :price, :bed, :bath, :name, :introduction, :location, :is_tv, :is_kitchen, :is_air, :is_heater, :is_wifi, :done, :pet, :parking, :breakfast).merge(user_id: current_user.id)
  end

  def set_room
    @room = Room.find(params[:id])
  end

end
