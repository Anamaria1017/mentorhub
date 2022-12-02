class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :profile, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def my_matches
    Match.where(mentor_id: self.profile.id).or(Match.where(mentee_id: self.profile.id))
  end
end
