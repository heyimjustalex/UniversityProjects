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

ActiveRecord::Schema[7.0].define(version: 2022_11_26_163926) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.integer "pesel", null: false
    t.string "name", null: false
    t.string "surname", null: false
    t.string "email", null: false
    t.string "phone_num", null: false
    t.date "born", null: false
    t.string "address", null: false
    t.boolean "disablity"
    t.string "mediacal_specialization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medical_interviews", force: :cascade do |t|
    t.string "hygiene"
    t.string "treatment_story"
    t.string "interview_description"
    t.bigint "meeting_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_medical_interviews_on_meeting_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.string "meeting_description"
    t.datetime "meeting_time", null: false
    t.bigint "patient_id", null: false
    t.bigint "doctor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_meetings_on_doctor_id"
    t.index ["patient_id"], name: "index_meetings_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.integer "pesel", null: false
    t.string "name", null: false
    t.string "surname", null: false
    t.string "email", null: false
    t.string "phone_num", null: false
    t.date "born", null: false
    t.string "address", null: false
    t.boolean "disablity"
    t.string "mediacal_offer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "medical_interviews", "meetings"
  add_foreign_key "meetings", "doctors"
  add_foreign_key "meetings", "patients"
end
