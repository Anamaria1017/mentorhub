class RemoveEndTimeFromMeetings < ActiveRecord::Migration[7.0]
  def change
    remove_column :meetings, :end_time
  end
end
