class LikesController < ApplicationController
  def update
    @like = Like.find(params[:id])
    if @like.liked
      @like.update!(liked: false)
    else
      @like.update!(liked: true)
    end
    redirect_back(fallback_location: matches_path)
  end

  private

  def like_params
    params.require(:like).permit(:liked)
  end
end
