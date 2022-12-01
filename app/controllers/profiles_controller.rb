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

  def find_mentees
    matching_profiles = Profile.joins(:user).where(profiles: { target_industry: @profile.target_industry, city: @profile.city }, users: { mentor: false })
    @matches = []
    matching_profiles.each do |profile|
      match = Match.create(mentee_id: profile.id, mentor_id: @profile.id)
      Chatroom.create(match_id: match.id)
      @matches << match
    end
    redirect_to profile_path(@profile), notice: "Profile was successfully updated. You might have new matches"
  end

  def find_mentors
    matching_profiles = Profile.joins(:user).where(profiles: {target_industry: @profile.target_industry, city: @profile.city}, users: {mentor: true})
    @matches = []
    matching_profiles.each do |profile|
        match = Match.create(mentor_id: profile.id, mentee_id: @profile.id)
        # Chatroom.create(match_id: match.id)
        @matches << match
    end
    redirect_to profile_path(@profile), notice: "Profile was successfully updated. You might have new matches"
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :username, :role, :birthday, :birthday, :languages, :city, :highest_education, :edu_organization, :working_experience, :current_position, :bio, :target_industry, :preferred_language, :type_of_meeting, :proximity_preference, :mentor_skills)
  end
end
