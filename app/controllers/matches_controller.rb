class MatchesController < ApplicationController
  before_action :set_match, only: %i[show update]
  before_action :authenticate_user!

  def index
      @profile = Profile.find_by(user: current_user)
      @matches = Match.where(mentor_id: @profile.id).or(Match.where(mentee_id: @profile.id)).where(match: true)
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
