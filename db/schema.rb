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

ActiveRecord::Schema.define(version: 2021_07_29_153748) do

  create_table "gardens", force: :cascade do |t|
    t.string "name"
    t.integer "length"
    t.integer "width"
    t.integer "depth"
    t.string "hardiness_zone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer "plant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "content"
    t.string "category"
    t.index ["plant_id"], name: "index_notes_on_plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.integer "per_sq_ft"
    t.string "days_to_harvest"
    t.string "planting_dates"
    t.text "icon"
    t.string "category"
    t.integer "garden_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["garden_id"], name: "index_plants_on_garden_id"
  end

end
