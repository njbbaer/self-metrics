# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_190_508_045_959) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cardio_reports', force: :cascade do |t|
    t.datetime 'finished_at'
    t.integer 'duration_seconds'
    t.float 'distance_miles'
    t.integer 'cardio_type'
    t.boolean 'machine'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'sleep_reports', force: :cascade do |t|
    t.datetime 'asleep_at'
    t.datetime 'wakeup_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'weight_reports', force: :cascade do |t|
    t.date 'datestamp'
    t.float 'weight_pounds'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
