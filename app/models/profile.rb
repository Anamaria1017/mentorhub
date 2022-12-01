class Profile < ApplicationRecord
  belongs_to :user
  has_many :matches_as_mentee, foreign_key: "mentee_id", class_name: "Match", dependent: :destroy
  has_many :matches_as_mentor, foreign_key: "mentor_id", class_name: "Match", dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :meetings, dependent: :destroy
  validates :first_name, :last_name, :username, :city, :target_industry, presence: true
  delegate :mentor, to: :user

  after_create :assign_matches
  # I had to remove mentor to be able to create mock data, why?s

  def assign_matches
    mentor ? find_mentees : find_mentors
  end

  def find_mentees
    matching_profiles = Profile.joins(:user).where(profiles: { target_industry: target_industry, city: city }, users: { mentor: false })
    matching_profiles.each { |profile| match = Match.create(mentee_id: profile.id, mentor_id: id) }
  end

  def find_mentors
    matching_profiles = Profile.joins(:user).where(profiles: { target_industry: target_industry, city: city }, users: { mentor: true })
    matching_profiles.each { |profile| match = Match.create(mentee_id: id, mentor_id: profile.id) }
  end
end
