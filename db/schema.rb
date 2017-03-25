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

ActiveRecord::Schema.define(version: 20170319202548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cast_member_movies", force: :cascade do |t|
    t.integer  "cast_member_id"
    t.integer  "movie_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["cast_member_id"], name: "index_cast_member_movies_on_cast_member_id", using: :btree
    t.index ["movie_id"], name: "index_cast_member_movies_on_movie_id", using: :btree
  end

  create_table "cast_members", force: :cascade do |t|
    t.datetime "birthday"
    t.text     "description"
    t.datetime "died"
    t.string   "name"
    t.string   "photos"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_movies", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "movie_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_category_movies_on_category_id", using: :btree
    t.index ["movie_id"], name: "index_category_movies_on_movie_id", using: :btree
  end

  create_table "director_movies", force: :cascade do |t|
    t.integer  "director_id"
    t.integer  "movie_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["director_id"], name: "index_director_movies_on_director_id", using: :btree
    t.index ["movie_id"], name: "index_director_movies_on_movie_id", using: :btree
  end

  create_table "directors", force: :cascade do |t|
    t.datetime "birthday"
    t.text     "description"
    t.datetime "died"
    t.string   "name"
    t.string   "photos"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "movie_production_companies", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "production_company_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["movie_id"], name: "index_movie_production_companies_on_movie_id", using: :btree
    t.index ["production_company_id"], name: "index_movie_production_companies_on_production_company_id", using: :btree
  end

  create_table "movie_writers", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "writer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_movie_writers_on_movie_id", using: :btree
    t.index ["writer_id"], name: "index_movie_writers_on_writer_id", using: :btree
  end

  create_table "movies", force: :cascade do |t|
    t.integer  "budget"
    t.string   "country"
    t.string   "filming_locations"
    t.integer  "gross"
    t.string   "language"
    t.string   "motion_picture_rated"
    t.string   "official_site"
    t.string   "poster"
    t.decimal  "rating"
    t.datetime "release_date"
    t.integer  "runtime"
    t.text     "storyline"
    t.string   "title"
    t.string   "videos"
    t.integer  "vote_count"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "production_companies", force: :cascade do |t|
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
    t.datetime "birthday"
    t.text     "description"
    t.datetime "died"
    t.string   "name"
    t.string   "photos"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "cast_member_movies", "cast_members"
  add_foreign_key "cast_member_movies", "movies"
  add_foreign_key "category_movies", "categories"
  add_foreign_key "category_movies", "movies"
  add_foreign_key "director_movies", "directors"
  add_foreign_key "director_movies", "movies"
  add_foreign_key "movie_production_companies", "movies"
  add_foreign_key "movie_production_companies", "production_companies"
  add_foreign_key "movie_writers", "movies"
  add_foreign_key "movie_writers", "writers"
end
