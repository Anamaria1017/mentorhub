class MatchesController < ApplicationController
  before_action :set_match, only: %i[show update]

  def index
      @profile = Profile.find_by(user: current_user)
      @matches = Match.where(mentor_id: @profile.id).or(Match.where(mentee_id: @profile.id))
  end

  def show
  end

  def update
    @match.update!(match: false)
    flash[:success] = "Match was successfully unmatched"
    redirect_to matches_path
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end
end
