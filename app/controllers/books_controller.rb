class BooksController < ApplicationController
  before_action :authenticate_user!

  def create
    room = Room.find(params[:room_id])

    if !(current_user == room.user)

      start_date = Date.parse(book_params[:start_date])
      end_date = Date.parse(book_params[:end_date])
      days = (end_date - start_date).to_i

      @book = current_user.books.new(book_params)
      @book.room = room
      @book.price = room.price
      @book.total_price = room.price * days
      @book.save

      flash[:notice] = "予約できました"
    end
    redirect_to room
  end


  private
    def book_params
      params.require(:book).permit(:start_date, :end_date)
    end
end
