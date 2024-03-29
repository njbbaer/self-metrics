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

ActiveRecord::Schema[7.0].define(version: 2022_11_18_070013) do
  create_table "cardio_reports", force: :cascade do |t|
    t.date "date"
    t.integer "duration_seconds"
    t.float "distance_miles"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "activity_type"
    t.integer "elevation_gain_feet"
    t.string "location"
  end

  create_table "sleep_reports", force: :cascade do |t|
    t.datetime "asleep_at", precision: nil
    t.datetime "wakeup_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "weight_reports", force: :cascade do |t|
    t.date "date"
    t.float "weight_pounds"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

end
