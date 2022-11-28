class Match < ApplicationRecord
  belongs_to :mentor, class_name: 'Profile', :foreign_key => :mentor_id
  belongs_to :mentee, class_name: 'Profile', :foreign_key => :mentee_id
  has_many :chatrooms, dependent: :destroy
  has_many :meetings, dependent: :destroy
end
