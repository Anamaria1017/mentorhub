class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @chatroom = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @meeting.match = @match
    # assign meeting to right user
    @meeting.profile = current_user
    if @chatroom.save
      redirect_to chatrooms_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:message, :match_id )
  end
end
