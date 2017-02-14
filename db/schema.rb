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

ActiveRecord::Schema.define(version: 20170214100111) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "duration"
    t.integer  "audience"
    t.text     "course_objective"
    t.integer  "no_of_objective"
    t.integer  "session"
    t.integer  "skill_based"
    t.integer  "knowledge_based"
    t.integer  "user_id"
    t.integer  "learner_style_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.index ["learner_style_id"], name: "index_courses_on_learner_style_id", using: :btree
    t.index ["user_id"], name: "index_courses_on_user_id", using: :btree
  end

  create_table "learner_dimension_scales", force: :cascade do |t|
    t.string   "name"
    t.integer  "learner_style_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["learner_style_id"], name: "index_learner_dimension_scales_on_learner_style_id", using: :btree
  end

  create_table "learner_styles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.integer  "objective_id"
    t.string   "content_file_name"
    t.string   "content_content_type"
    t.integer  "content_file_size"
    t.datetime "content_updated_at"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["objective_id"], name: "index_lessons_on_objective_id", using: :btree
  end

  create_table "objectives", force: :cascade do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_objectives_on_course_id", using: :btree
  end

  create_table "porfiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.integer  "learner_dimension_scale_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["learner_dimension_scale_id"], name: "index_porfiles_on_learner_dimension_scale_id", using: :btree
    t.index ["user_id"], name: "index_porfiles_on_user_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "answer_a"
    t.string   "answer_b"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role_id",                default: 3
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  add_foreign_key "courses", "learner_styles"
  add_foreign_key "courses", "users"
  add_foreign_key "learner_dimension_scales", "learner_styles"
  add_foreign_key "lessons", "objectives"
  add_foreign_key "objectives", "courses"
  add_foreign_key "porfiles", "learner_dimension_scales"
  add_foreign_key "porfiles", "users"
  add_foreign_key "users", "roles"
end
