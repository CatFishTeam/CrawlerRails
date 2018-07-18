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

ActiveRecord::Schema.define(version: 2018_07_17_234954) do

  create_table "metadata_verifs", force: :cascade do |t|
    t.integer "title"
    t.integer "viewport"
    t.integer "description"
    t.integer "charset"
    t.integer "h1"
    t.integer "website_id"
    t.index ["website_id"], name: "index_metadata_verifs_on_website_id"
  end

  create_table "page_speed", force: :cascade do |t|
    t.integer "score"
    t.integer "websites_id"
    t.index ["websites_id"], name: "index_page_speed_on_websites_id"
  end

  create_table "spider_results", force: :cascade do |t|
    t.string "urlFrom"
    t.string "urlTo"
    t.integer "response"
    t.integer "website_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["website_id"], name: "index_spider_results_on_website_id"
  end

  create_table "stats", force: :cascade do |t|
    t.integer "scorePerf"
    t.integer "scoreSpider"
    t.integer "scoreW3C"
    t.datetime "date"
    t.integer "website_id"
    t.index ["website_id"], name: "index_stats_on_website_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "w3cs", force: :cascade do |t|
    t.integer "fault"
    t.integer "website_id"
    t.index ["website_id"], name: "index_w3cs_on_website_id"
  end

  create_table "websites", force: :cascade do |t|
    t.string "url", null: false
    t.integer "score_page_speed"
    t.integer "score_spider"
    t.integer "score_w3c"
    t.integer "user_id"
    t.index ["user_id"], name: "index_websites_on_user_id"
  end

end
