class Meeting < ApplicationRecord
  belongs_to :match

  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2
  }, _prefix: true
end
