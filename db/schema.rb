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

ActiveRecord::Schema.define(version: 2022_04_01_163800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "college_subjects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "department_id"
    t.string "indentifier"
    t.bigint "college_subject_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["college_subject_id"], name: "index_college_subjects_on_college_subject_id"
    t.index ["department_id"], name: "index_college_subjects_on_department_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "indentifier"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "couse_subjects", force: :cascade do |t|
    t.bigint "college_subject_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["college_subject_id"], name: "index_couse_subjects_on_college_subject_id"
    t.index ["course_id"], name: "index_couse_subjects_on_course_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "indentifier"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "student_courses", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_student_courses_on_course_id"
    t.index ["student_id"], name: "index_student_courses_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name", null: false
    t.string "registration", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "college_subjects", "college_subjects"
  add_foreign_key "college_subjects", "departments"
  add_foreign_key "couse_subjects", "college_subjects"
  add_foreign_key "couse_subjects", "courses"
  add_foreign_key "student_courses", "courses"
  add_foreign_key "student_courses", "students"
end
