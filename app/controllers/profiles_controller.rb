class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :user_name, :role, :birthday, :birthday, :languages, :city, :highest_education, :edu_organization, :working_experience, :current_position, :bio, :target_industry, :preferred_language, :type_of_meeting, :proximity_preference, :mentor_skills)
  end
end
