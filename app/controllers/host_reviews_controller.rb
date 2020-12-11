class HostReviewsController < ApplicationController

  def create
    @book = Book.where(
                      id: host_review_params[:book_id],
                      room_id: host_review_params[:room_id],
                      user_id: host_review_params[:guest_id]
                      ).first

    if !(@book.nil?)

      @reviewed = HostReview.where(
                                  book_id: @book.id,
                                  guest_id: host_review_params[:guest_id]
                                  ).first
      if @reviewed.nil?
        @host_review = current_user.host_reviews.create(host_review_params)
        redirect_back(fallback_location: request.referer)
      else
        redirect_to root_path
      end

    else
      redirect_to root_path
    end
    
  end

  private

  def host_review_params
    params.require(:host_review).permit(:title, :comment, :like, :room_id, :book_id, :guest_id)
  end
end