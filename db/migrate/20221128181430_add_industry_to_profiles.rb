class AddIndustryToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :mentor_industry, :string
    rename_column :profiles, :role, :mentor
    rename_column :profiles, :user_name, :username
  end
end
