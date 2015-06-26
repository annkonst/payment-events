ActiveRecord::Schema.define(version: 20150625084220) do

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_users", id: false, force: true do |t|
    t.integer "user_id",  null: false
    t.integer "event_id", null: false
  end

  create_table "invites", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "state",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_lists", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.decimal  "price",      precision: 5, scale: 2
  end

  create_table "product_lists_users", id: false, force: true do |t|
    t.integer "product_list_id", null: false
    t.integer "user_id",         null: false
  end

  create_table "user_events", force: true do |t|
    t.string   "name"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
