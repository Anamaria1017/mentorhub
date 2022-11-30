class MeetingsController < ApplicationController
  before_action :set_match, only: %i[new create]

  def index
    # find the right user
    @meeting.profile = current_user.profiles.first
    @meeting = Metting.where(profile_id: current_user)
  end

  def new
    # @match = Match.find(params[:match_id])
    @meeting = Meeting.new
  end

  def create
    # @match = Match.find(params[:match_id])
    @meeting = Meeting.new(meeting_params)
    @meeting.match = @match
    # assign meeting to right user
    @meeting.profile = current_user
    if @metting.save
      redirect_to meetings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @meeting = Meeting.find(params[:id])
    # @meeting.update(meeting_params)
    if params[:status] == "1"
      # @Meeting.accepted!
      @meeting.update!(status: 1)
      flash[:success] = "Meeting was accepted"
      redirect_to meeting_path
    elsif params[:status] == "2"
      # @meeting.declined!
      @meeting.update!(status: 2)
      flash[:error] = "Meeting was declined"
      redirect_to meeting_path
    end
  end

  private

  def set_match
    @match = Match.find(params[:match_id])
  end

  def meeting_params
    params.require(:meeting).permit(:date, :time, :subject, :location, :status)
  end
end
