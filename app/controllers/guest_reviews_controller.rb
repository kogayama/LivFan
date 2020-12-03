class GuestReviewsController < ApplicationController

  def create
    @book = Book.where(
                      id: guest_review_params[:book_id],
                      room_id: guest_review_params[:room_id]
                      ).first

    if !@book.nil? && @book.room.user.id == guest_review_params[:host_id].to_i

      @reviewed = GuestReview.where(
                                    book_id: @book.id,
                                    host_id: guest_review_params[:host_id]
                                    ).first
      if @reviewed.nil?
        @guest_review = current_user.guest_reviews.create(guest_review_params)
        redirect_back(fallback_location: request.referer)
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
  end

  private

  def guest_review_params
    params.require(:guest_review).permit(:title, :comment, :like, :room_id, :book_id, :host_id)
  end
end