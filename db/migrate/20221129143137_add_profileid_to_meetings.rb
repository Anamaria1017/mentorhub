class AddProfileidToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_reference :meetings, :profile, null: false, foreign_key: true
  end
end
