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

ActiveRecord::Schema[7.0].define(version: 2023_05_19_150026) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "region_code"
    t.string "geocode"
  end

  create_table "assignments_surveyors", id: false, force: :cascade do |t|
    t.bigint "surveyor_id", null: false
    t.bigint "assignment_id", null: false
    t.index ["assignment_id"], name: "index_assignments_surveyors_on_assignment_id"
    t.index ["surveyor_id"], name: "index_assignments_surveyors_on_surveyor_id"
  end

  create_table "homes", force: :cascade do |t|
    t.string "street_number"
    t.string "street_name"
    t.string "unit_number"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "building_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assignment_id"
    t.integer "visit_order"
    t.index ["assignment_id", "visit_order"], name: "index_homes_on_assignment_id_and_visit_order", unique: true
    t.index ["assignment_id"], name: "index_homes_on_assignment_id"
  end

  create_table "jwt_denylists", force: :cascade do |t|
    t.string "jti"
    t.datetime "expired_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylists_on_jti"
  end

  create_table "property_assessments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pid"
    t.bigint "cm_id"
    t.bigint "gis_id"
    t.string "st_num"
    t.string "st_name"
    t.integer "unit_num"
    t.string "city"
    t.string "zipcode"
    t.integer "bldg_seq"
    t.integer "num_bldgs"
    t.integer "luc"
    t.string "lu", limit: 2
    t.string "lu_desc"
    t.string "bldg_type"
    t.boolean "own_occ"
    t.string "owner"
    t.string "mail_addressee"
    t.string "mail_address"
    t.string "mail_city"
    t.string "mail_state"
    t.string "mail_zipcode"
    t.float "res_floor"
    t.integer "cd_floor"
    t.integer "res_units"
    t.integer "com_units"
    t.integer "rc_units"
    t.integer "land_sf"
    t.integer "gross_area"
    t.integer "living_area"
    t.integer "land_value"
    t.integer "bldg_value"
    t.integer "total_value"
    t.integer "gross_tax"
    t.integer "yr_built"
    t.integer "yr_remodel"
    t.string "structure_class"
    t.string "roof_structure"
    t.string "roof_cover"
    t.string "int_wall"
    t.string "ext_finished"
    t.integer "int_cond"
    t.integer "ext_cond"
    t.integer "overall_cond"
    t.integer "bed_rms"
    t.integer "full_bth"
    t.integer "hlf_bth"
    t.integer "kitchen"
    t.integer "tt_rms"
    t.string "bdrm_cond"
    t.string "bthrm_style1"
    t.string "bthrm_style2"
    t.string "bthrm_style3"
    t.string "kitchen_type"
    t.string "kitchen_style1"
    t.string "kitchen_style2"
    t.string "kitchen_style3"
    t.string "heat_type"
    t.string "heat_fuel"
    t.string "ac_type"
    t.integer "fire_place"
    t.string "orientation"
    t.integer "num_parking"
    t.string "prop_view"
    t.boolean "corner_unit"
  end

  create_table "survey_answers", force: :cascade do |t|
    t.text "answer"
    t.bigint "survey_response_id", null: false
    t.bigint "survey_question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_question_id"], name: "index_survey_answers_on_survey_question_id"
    t.index ["survey_response_id"], name: "index_survey_answers_on_survey_response_id"
  end

  create_table "survey_questions", force: :cascade do |t|
    t.text "text"
    t.integer "response_type"
    t.string "response_options", array: true
    t.bigint "survey_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "display_order", default: 0, null: false
    t.index ["response_options"], name: "index_survey_questions_on_response_options", using: :gin
    t.index ["survey_id", "display_order"], name: "index_survey_questions_on_survey_id_and_display_order", unique: true
    t.index ["survey_id"], name: "index_survey_questions_on_survey_id"
  end

  create_table "survey_responses", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "survey_visit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ip"
    t.float "recaptcha_score"
    t.boolean "completed"
    t.index ["survey_id"], name: "index_survey_responses_on_survey_id"
    t.index ["survey_visit_id"], name: "index_survey_responses_on_survey_visit_id"
  end

  create_table "survey_visits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "home_id"
    t.bigint "surveyor_id"
    t.index ["home_id"], name: "index_survey_visits_on_home_id"
    t.index ["surveyor_id"], name: "index_survey_visits_on_surveyor_id"
  end

  create_table "surveyors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "phone"
    t.string "street_address"
    t.string "geocode"
    t.string "city"
    t.string "zipcode"
    t.string "state"
    t.string "role"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_surveyors_on_user_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "survey_answers", "survey_questions"
  add_foreign_key "survey_answers", "survey_responses"
  add_foreign_key "survey_questions", "surveys"
  add_foreign_key "survey_responses", "survey_visits"
  add_foreign_key "survey_responses", "surveys"
  add_foreign_key "survey_visits", "surveyors"
  add_foreign_key "surveyors", "users"
end
