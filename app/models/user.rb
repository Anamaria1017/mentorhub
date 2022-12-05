class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :profile, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def my_matches
    Match.where(mentor_id: self.profile.id).or(Match.where(mentee_id: self.profile.id))
  end

  def last_chat
    scope_prefix = "matches_as_"
    scope_sufix = mentor? ? "mentor" : "mentee"
    matches = profile.public_send(scope_prefix + scope_sufix)
    chatrooms = Chatroom.where(match: matches)
    chatrooms.map(&:messages).flatten.max_by(&:created_at)&.chatroom&.id || chatrooms.last.id
  end

  def mentor?
    mentor
  end
end
