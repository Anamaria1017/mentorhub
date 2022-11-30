class Profile < ApplicationRecord
  belongs_to :user
  has_many :matches_as_mentee, foreign_key: "mentee_id", class_name: "Match", dependent: :destroy
  has_many :matches_as_mentor, foreign_key: "mentor_id", class_name: "Match", dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :meetings, dependent: :destroy
  validates :first_name, :last_name, :username, :city, :target_industry, presence: true
  delegate :mentor, to: :user
  # I had to remove mentor to be able to create mock data, why?
end
