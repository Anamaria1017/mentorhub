class Match < ApplicationRecord
  belongs_to :mentor, class_name: 'Profile', :foreign_key => :mentor_id
  belongs_to :mentee, class_name: 'Profile', :foreign_key => :mentee_id
  validates :mentor_id, uniqueness: { scope: :mentee_id, message: "Is already in the matches list" }
  has_many :meetings, dependent: :destroy
  has_one :chatroom
  has_one :like, dependent: :destroy
  after_create :create_chatroom_for_match
  after_create :create_like_for_match

  def create_chatroom_for_match
    Chatroom.create(match_id: id)
  end

  def create_like_for_match
    Like.create(match_id: id, liked: false, profile_id: mentor_id)
    Like.create(match_id: id, liked: false, profile_id: mentee_id)
  end
end
