class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.boolean :role
      t.date :birthday
      t.string :languages
      t.string :city
      t.string :highest_education
      t.string :edu_organization
      t.string :working_experience
      t.string :current_position
      t.text :bio
      t.string :target_industry
      t.string :preferred_language
      t.string :type_of_meeting
      t.string :proximity_preference
      t.string :mentor_skills
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
