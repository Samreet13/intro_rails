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

ActiveRecord::Schema[7.2].define(version: 2026_03_23_162458) do
  create_table "film_characters", force: :cascade do |t|
    t.integer "film_id", null: false
    t.integer "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_film_characters_on_film_id"
    t.index ["person_id"], name: "index_film_characters_on_person_id"
  end

  create_table "film_starships", force: :cascade do |t|
    t.integer "film_id", null: false
    t.integer "starship_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_film_starships_on_film_id"
    t.index ["starship_id"], name: "index_film_starships_on_starship_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "title"
    t.integer "episode_id"
    t.string "director"
    t.string "producer"
    t.string "release_date"
    t.text "opening_crawl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "birth_year"
    t.string "gender"
    t.string "height"
    t.string "mass"
    t.string "hair_color"
    t.string "eye_color"
    t.string "skin_color"
    t.integer "planet_id"
    t.integer "species_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planet_id"], name: "index_people_on_planet_id"
    t.index ["species_id"], name: "index_people_on_species_id"
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.string "climate"
    t.string "terrain"
    t.string "population"
    t.string "diameter"
    t.string "rotation_period"
    t.string "orbital_period"
    t.string "gravity"
    t.string "surface_water"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.string "classification"
    t.string "designation"
    t.string "language"
    t.string "average_height"
    t.string "average_lifespan"
    t.string "eye_colors"
    t.string "hair_colors"
    t.string "skin_colors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "starships", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "starship_class"
    t.string "manufacturer"
    t.string "cost_in_credits"
    t.string "length"
    t.string "crew"
    t.string "passengers"
    t.string "hyperdrive_rating"
    t.string "mglt"
    t.string "cargo_capacity"
    t.string "consumables"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "film_characters", "films"
  add_foreign_key "film_characters", "people"
  add_foreign_key "film_starships", "films"
  add_foreign_key "film_starships", "starships"
  add_foreign_key "people", "planets"
  add_foreign_key "people", "species"
end
