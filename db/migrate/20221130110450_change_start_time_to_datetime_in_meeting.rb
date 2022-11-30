class ChangeStartTimeToDatetimeInMeeting < ActiveRecord::Migration[7.0]
  def change
    change_column :meetings, :start_time, :datetime
  end
end
