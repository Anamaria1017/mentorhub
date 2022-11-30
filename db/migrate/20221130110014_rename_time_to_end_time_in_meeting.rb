class RenameTimeToEndTimeInMeeting < ActiveRecord::Migration[7.0]
  def change
    rename_column :meetings, :time, :end_time
  end
end
