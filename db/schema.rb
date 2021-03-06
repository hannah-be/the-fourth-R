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

ActiveRecord::Schema.define(version: 20171109033142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "suburb"
    t.string "state"
    t.string "postcode"
    t.string "country"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "repairer_id"
    t.index ["repairer_id"], name: "index_addresses_on_repairer_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "conversations", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.bigint "repair_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_conversations_on_recipient_id"
    t.index ["repair_id"], name: "index_conversations_on_repair_id"
    t.index ["sender_id"], name: "index_conversations_on_sender_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.text "description"
    t.text "problem"
    t.text "photo_data"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.index ["address_id"], name: "index_items_on_address_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["created_at"], name: "index_messages_on_created_at"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "phone"
    t.text "photo_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "repairers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "business_name"
    t.bigint "address_id"
    t.string "category"
    t.text "description"
    t.boolean "will_travel"
    t.text "photo_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_repairers_on_address_id"
    t.index ["business_name"], name: "index_repairers_on_business_name", unique: true
    t.index ["category"], name: "index_repairers_on_category"
    t.index ["user_id"], name: "index_repairers_on_user_id"
  end

  create_table "repairs", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "repairer_id"
    t.string "charge_identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["item_id"], name: "index_repairs_on_item_id"
    t.index ["repairer_id"], name: "index_repairs_on_repairer_id"
    t.index ["user_id"], name: "index_repairs_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "skill"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "repairers"
  add_foreign_key "conversations", "repairs"
  add_foreign_key "conversations", "users", column: "recipient_id"
  add_foreign_key "conversations", "users", column: "sender_id"
  add_foreign_key "items", "addresses"
  add_foreign_key "items", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "repairers", "addresses"
  add_foreign_key "repairers", "users"
  add_foreign_key "repairs", "items"
  add_foreign_key "repairs", "repairers"
  add_foreign_key "repairs", "users"
end
