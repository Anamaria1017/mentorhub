class Match < ApplicationRecord
  belongs_to :mentor, class_name: 'Profile', :foreign_key => :mentor_id
  belongs_to :mentee, class_name: 'Profile', :foreign_key => :mentee_id
  validates :mentor_id, uniqueness: { scope: :mentee_id, message: "Is already in the matches list" }
  has_many :meetings, dependent: :destroy
  has_one :chatroom
  after_create :create_chatroom_for_match

  def create_chatroom_for_match
    Chatroom.create(match_id: id)
  end
end
