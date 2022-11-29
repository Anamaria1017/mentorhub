class RemoveMentorIndustryFromProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :mentor_industry, :string
  end
end
