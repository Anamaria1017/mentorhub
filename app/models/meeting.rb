class Meeting < ApplicationRecord
  belongs_to :match
  belongs_to :profile
  
  validates :start_time, :end_time, :location, presence: true

  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2
  }, _prefix: true
end
