class LikesController < ApplicationController
  def update
    @like = Like.find(params[:id])
    if @like.liked == false
      @like.update!(liked: true)
    else
      @like.update!(liked: false)
    end
    redirect_to matches_path
  end

  private

  def like_params
    params.require(:like).permit(:liked)
  end
end
