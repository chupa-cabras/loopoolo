# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180601201122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "encounter_id"
    t.integer  "user_id"
    t.boolean  "visible"
    t.text     "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["encounter_id"], name: "index_comments_on_encounter_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "logo"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "competencies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "competency_type_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["competency_type_id"], name: "index_competencies_on_competency_type_id", using: :btree
  end

  create_table "competencies_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "competency_id"
    t.integer  "level_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["competency_id"], name: "index_competencies_users_on_competency_id", using: :btree
    t.index ["level_id"], name: "index_competencies_users_on_level_id", using: :btree
    t.index ["user_id"], name: "index_competencies_users_on_user_id", using: :btree
  end

  create_table "competency_levels", force: :cascade do |t|
    t.integer  "competency_id"
    t.integer  "level_id"
    t.integer  "weight"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["competency_id"], name: "index_competency_levels_on_competency_id", using: :btree
    t.index ["level_id"], name: "index_competency_levels_on_level_id", using: :btree
  end

  create_table "competency_types", force: :cascade do |t|
    t.string   "name",                    null: false
    t.string   "description",             null: false
    t.integer  "weight",      default: 1
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "encounters", force: :cascade do |t|
    t.datetime "date"
    t.integer  "status"
    t.text     "observations"
    t.integer  "target_id"
    t.integer  "owner_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string   "name"
    t.string   "description",             null: false
    t.integer  "weight",      default: 1
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "quests", force: :cascade do |t|
    t.string   "description"
    t.integer  "requestor_id"
    t.integer  "executor_id"
    t.integer  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["executor_id"], name: "index_quests_on_executor_id", using: :btree
    t.index ["requestor_id"], name: "index_quests_on_requestor_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "logo"
    t.string   "name"
    t.string   "description"
    t.integer  "company_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["company_id"], name: "index_teams_on_company_id", using: :btree
  end

  create_table "user_competency_levels", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "competency_id"
    t.integer  "level_id"
    t.date     "started_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["competency_id"], name: "index_user_competency_levels_on_competency_id", using: :btree
    t.index ["level_id"], name: "index_user_competency_levels_on_level_id", using: :btree
    t.index ["user_id"], name: "index_user_competency_levels_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_teams", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.index ["team_id"], name: "index_users_teams_on_team_id", using: :btree
    t.index ["user_id"], name: "index_users_teams_on_user_id", using: :btree
  end

  add_foreign_key "comments", "encounters"
  add_foreign_key "comments", "users"
  add_foreign_key "competencies", "competency_types"
  add_foreign_key "competencies_users", "levels"
  add_foreign_key "competency_levels", "competencies"
  add_foreign_key "competency_levels", "levels"
  add_foreign_key "teams", "companies"
  add_foreign_key "user_competency_levels", "competencies"
  add_foreign_key "user_competency_levels", "levels"
  add_foreign_key "user_competency_levels", "users"
end
