require 'pry'

class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new(user: current_user)
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to profile_path(@profile), notice: "Profile was successfully updated. You might have new matches"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.mentor && @profile.update(profile_params)

      find_mentees

    elsif @profile.mentor == false && @profile.update(profile_params)

      find_mentors
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :username, :role, :birthday, :birthday, :languages, :city, :highest_education, :edu_organization, :working_experience, :current_position, :bio, :target_industry, :preferred_language, :type_of_meeting, :proximity_preference, :mentor_skills)
  end
end
