class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.create!(permitted_params)

    respond_to do |format|
      format.html { redirect_to room_path(@room) }
      format.turbo_stream
    end
  end

  private

  def permitted_params
    params.require(:message).permit(:text)
  end
end
