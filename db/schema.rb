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

ActiveRecord::Schema.define(version: 20170318214759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "awards", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cast_members", force: :cascade do |t|
    t.integer  "award_ids"
    t.datetime "birthday"
    t.text     "description"
    t.datetime "died"
    t.integer  "movie_ids"
    t.string   "name"
    t.string   "photos"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["award_ids"], name: "index_cast_members_on_award_ids", using: :btree
    t.index ["movie_ids"], name: "index_cast_members_on_movie_ids", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "movie_ids"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_ids"], name: "index_categories_on_movie_ids", using: :btree
  end

  create_table "directors", force: :cascade do |t|
    t.integer  "award_ids"
    t.datetime "birthday"
    t.text     "description"
    t.datetime "died"
    t.integer  "movie_ids"
    t.string   "name"
    t.string   "photos"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["award_ids"], name: "index_directors_on_award_ids", using: :btree
    t.index ["movie_ids"], name: "index_directors_on_movie_ids", using: :btree
  end

  create_table "movies", force: :cascade do |t|
    t.integer  "cast_members_id"
    t.integer  "categories_id"
    t.integer  "directors_id"
    t.integer  "production_company_id"
    t.integer  "writers_id"
    t.integer  "awards"
    t.integer  "budget"
    t.string   "country"
    t.string   "filming_locations"
    t.integer  "gross"
    t.string   "language"
    t.string   "motion_picture_rated"
    t.string   "official_site"
    t.string   "photos"
    t.decimal  "rating"
    t.datetime "release_date"
    t.integer  "runtime"
    t.text     "storyline"
    t.string   "title"
    t.string   "videos"
    t.integer  "vote_count"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["cast_members_id"], name: "index_movies_on_cast_members_id", using: :btree
    t.index ["categories_id"], name: "index_movies_on_categories_id", using: :btree
    t.index ["directors_id"], name: "index_movies_on_directors_id", using: :btree
    t.index ["production_company_id"], name: "index_movies_on_production_company_id", using: :btree
    t.index ["writers_id"], name: "index_movies_on_writers_id", using: :btree
  end

  create_table "production_companies", force: :cascade do |t|
    t.integer  "movie_ids"
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "writers", force: :cascade do |t|
    t.integer  "award_ids"
    t.datetime "birthday"
    t.text     "description"
    t.datetime "died"
    t.integer  "movie_ids"
    t.string   "name"
    t.string   "photos"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["award_ids"], name: "index_writers_on_award_ids", using: :btree
    t.index ["movie_ids"], name: "index_writers_on_movie_ids", using: :btree
  end

  add_foreign_key "movies", "cast_members", column: "cast_members_id"
  add_foreign_key "movies", "categories", column: "categories_id"
  add_foreign_key "movies", "directors", column: "directors_id"
  add_foreign_key "movies", "production_companies"
  add_foreign_key "movies", "writers", column: "writers_id"
end
