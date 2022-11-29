# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_29_143137) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_chatrooms_on_match_id"
  end

  create_table "matches", force: :cascade do |t|
    t.boolean "match", default: true
    t.integer "mentor_id"
    t.integer "mentee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.string "subject"
    t.string "location"
    t.integer "status", default: 0
    t.bigint "match_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_id", null: false
    t.index ["match_id"], name: "index_meetings_on_match_id"
    t.index ["profile_id"], name: "index_meetings_on_profile_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "chatroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_id", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["profile_id"], name: "index_messages_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.boolean "mentor"
    t.date "birthday"
    t.string "languages"
    t.string "city"
    t.string "highest_education"
    t.string "edu_organization"
    t.string "working_experience"
    t.string "position"
    t.text "bio"
    t.string "target_industry"
    t.string "preferred_language"
    t.string "type_of_meeting"
    t.string "proximity_preference"
    t.string "mentor_skills"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chatrooms", "matches"
  add_foreign_key "meetings", "matches"
  add_foreign_key "meetings", "profiles"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "profiles"
  add_foreign_key "profiles", "users"
end
