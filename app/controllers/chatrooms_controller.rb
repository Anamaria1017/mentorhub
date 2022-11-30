class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @chatrooms = Chatroom.all
  end

  def create
    @chatroom = Chatroom.new

    @chatroom.match = @match
    # assign meeting to right user
    if @chatroom.save
      redirect_to chatrooms_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
