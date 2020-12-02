class RoomImagesController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    if params[:images]
     
      params[:images].each do |img|
        @room.room_images.create(image: img)
        
      end

      @room_images = @room.room_images
      redirect_back(fallback_location: request.referer, notice: "保存しました")
    end
  end

  def destroy

    @room_image = RoomImage.find(params[:id])
    @room = @room_image.room

    @room_image.destroy
    @room_images = RoomImage.where(room_id: @room.id)
    redirect_back(fallback_location: request.referer, notice: "削除しました")
  end

end

