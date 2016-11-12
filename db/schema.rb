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

ActiveRecord::Schema.define(version: 20161026035030) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.string   "telephone"
    t.string   "password"
    t.integer  "center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["center_id"], name: "index_admins_on_center_id"
  end

  create_table "centers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["center_id"], name: "index_departments_on_center_id"
  end

  create_table "disables", force: :cascade do |t|
    t.date     "begin"
    t.date     "end"
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_disables_on_room_id"
  end

  create_table "observations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string   "description"
    t.integer  "teacher_id"
    t.integer  "room_id"
    t.integer  "observation_id"
    t.date     "date"
    t.integer  "hour"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["observation_id"], name: "index_reservations_on_observation_id"
    t.index ["room_id"], name: "index_reservations_on_room_id"
    t.index ["teacher_id"], name: "index_reservations_on_teacher_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources_rooms", id: false, force: :cascade do |t|
    t.integer "resource_id"
    t.integer "room_id"
    t.index ["resource_id"], name: "index_resources_rooms_on_resource_id"
    t.index ["room_id"], name: "index_resources_rooms_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "location"
    t.integer  "capacity"
    t.integer  "center_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["center_id"], name: "index_rooms_on_center_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.string   "telephone"
    t.string   "password"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_teachers_on_department_id"
  end

end
