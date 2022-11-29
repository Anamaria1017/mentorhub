class RenameCurrentPositionToPositionInProfiles < ActiveRecord::Migration[7.0]
  def change
    rename_column :profiles, "current_position", "position"
  end
end
