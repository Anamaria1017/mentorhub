class MatchesController < ApplicationController
  before_action :set_match, only: %i[show update]
  before_action :authenticate_user!

  def index
    @profile = Profile.find(current_user.profile.id)
    @matches = Match.where(mentor_id: @profile.id).or(Match.where(mentee_id: @profile.id)).where(match: true)
    @matches = @matches.select { |match| match.like.liked? } if params[:status] == "liked"
    if params[:status] == "new_matches"
      @matches = Match.whereDay(created_at: Date.today)
    end
  end

  def show
    @profile = Profile.find_by(user: current_user)
  end

  def update
    if params[:match] == "false"
      @match.update!(match: false)
      flash[:success] = "Match was successfully unmatched"
    end
    redirect_to matches_path
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end
end
