class MeetingsController < ApplicationController
  before_action :set_match, only: %i[new create]

  def index
    # find the right user
    # @meeting.profile = current_user.profile
    start_date = params.fetch(:start_date, Date.today).to_date
    @meetings = Meeting.joins(:match).where(matches: { mentor_id: current_user.profile.id })
                       .or(Meeting.joins(:match).where(matches: { mentee_id: current_user.profile.id }))
                       .where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def new
    @match = Match.find(params[:match_id])
    @meeting = Meeting.new
  end

  def create
    @match = Match.find(params[:match_id])
    @meeting = Meeting.new(meeting_params)
    @meeting.match = @match
    # assign meeting to right user
    @meeting.profile = current_user.profile
    if @meeting.save
      redirect_to meetings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    if params[:status] == "1"
      @meeting.update!(status: 1)
      flash[:success] = "Meeting was accepted"
      redirect_to meeting_path(@meeting)
    elsif params[:status] == "2"
      @meeting.update!(status: 2)
      flash[:error] = "Meeting was declined"
      redirect_to meetings_path
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to meetings_path, status: :see_other
  end

  private

  def set_match
    @match = Match.find(params[:match_id])
  end

  def meeting_params
    params.require(:meeting).permit(:start_time, :end_time, :name, :location)
  end
end
