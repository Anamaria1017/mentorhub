class RenameUserNameToUserNameInProfiles < ActiveRecord::Migration[7.0]
  def change
    rename_column :profiles, "role", "mentor"
    rename_column :profiles, "user_name", "username"
  end
end
