class User::ProfilesController < ApplicationController
  def new
    @profile = Profile.new(user: current_user)
  end
end
