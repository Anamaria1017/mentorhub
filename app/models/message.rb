class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :profile
end
