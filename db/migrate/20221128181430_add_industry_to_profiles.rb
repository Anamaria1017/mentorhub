class AddIndustryToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :mentor_industry, :string
  end
end
