class Like < ApplicationRecord
  belongs_to :profile
  belongs_to :match

  def liked?
    liked
  end
end
