class Profile < ApplicationRecord
  belongs_to :user
  has_many :matches_as_mentee, foreign_key: "mentee_id", class_name: "Match", dependent: :destroy
  has_many :matches_as_mentor, foreign_key: "mentor_id", class_name: "Match", dependent: :destroy
  validates :first_name, :last_name, :user_name, :role, :city, :target_industry, presence: true
end
