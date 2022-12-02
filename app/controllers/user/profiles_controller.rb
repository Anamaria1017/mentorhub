class User::ProfilesController < ApplicationController
  def new
    if current_user.profile
      redirect_to matches_path
    else
      @profile = Profile.new(user: current_user)
    end
  end
end
