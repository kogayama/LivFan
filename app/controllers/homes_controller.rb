class HomesController < ApplicationController
  def top
  end

  def search
    if params[:search].present? && params[:search].strip != ""
      session[:location] = params[:search]
    end

    if session[:location] && session[:location] != ""
      @rooms_location = Room.where(done: true).near(session[:location], 30, order: 'distance')
    else
      @rooms_location = Room.where(done: true).all
    end

    @search = @rooms_location.ransack(params[:q])
    @rooms = @search.result

    @arrRooms = @rooms.to_a

    if (params[:start_date] && params[:end_date] && !params[:start_date].empty? &&  !params[:end_date].empty?)

      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      @rooms.each do |room|

        is_disable = room.books.where(
                      "(? <= start_date AND start_date <= ?)
                      OR (? <= end_date AND end_date <= ?)
                      OR (start_date < ? AND ? < end_date)",
                      start_date, end_date,
                      start_date, end_date,
                      start_date, end_date
                    ).limit(1)

        if is_disable.length > 0
          @arrRooms.delete(room)
        end
      end
    end
    # if @arrRooms.length > 0
    #   @first_room_latitude = @arrRooms[0].latitude
    #   @first_room_longitude = @arrRooms[0].longitude
    # end
    
  end
end
