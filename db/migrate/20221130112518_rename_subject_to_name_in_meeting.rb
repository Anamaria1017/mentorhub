class RenameSubjectToNameInMeeting < ActiveRecord::Migration[7.0]
  def change
    rename_column :meetings, :subject, :name
  end
end
