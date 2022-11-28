class MatchesController < ApplicationController
  before_action :set_match, only: %i[show update]

  def index
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
