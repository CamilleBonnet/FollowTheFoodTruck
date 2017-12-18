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

ActiveRecord::Schema.define(version: 20171218173240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "truck_id"
    t.text     "street_address"
    t.text     "street_address_2"
    t.string   "city"
    t.integer  "zipcode"
    t.string   "country"
    t.text     "more_info"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "active_address"
    t.index ["truck_id"], name: "index_addresses_on_truck_id", using: :btree
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "baskets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "truck_order_list_id"
    t.date     "date"
    t.datetime "time"
    t.string   "status"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "truck_id"
    t.integer  "total_price_cents",   default: 0, null: false
    t.index ["truck_id"], name: "index_baskets_on_truck_id", using: :btree
    t.index ["truck_order_list_id"], name: "index_baskets_on_truck_order_list_id", using: :btree
    t.index ["user_id"], name: "index_baskets_on_user_id", using: :btree
  end

  create_table "calendars", force: :cascade do |t|
    t.integer  "address_id"
    t.date     "starting_date"
    t.date     "ending_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "truck_id"
    t.index ["address_id"], name: "index_calendars_on_address_id", using: :btree
    t.index ["truck_id"], name: "index_calendars_on_truck_id", using: :btree
  end

  create_table "choices", force: :cascade do |t|
    t.integer  "basket_id"
    t.integer  "meal_id"
    t.integer  "user_id"
    t.integer  "quantity"
    t.date     "date"
    t.datetime "time"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "price_cents", default: 0, null: false
    t.index ["basket_id"], name: "index_choices_on_basket_id", using: :btree
    t.index ["meal_id"], name: "index_choices_on_meal_id", using: :btree
    t.index ["user_id"], name: "index_choices_on_user_id", using: :btree
  end

  create_table "meals", force: :cascade do |t|
    t.integer  "truck_id"
    t.string   "description"
    t.boolean  "is_vegan"
    t.boolean  "is_fat_free"
    t.boolean  "is_alergen"
    t.boolean  "is_gluten_free"
    t.integer  "spicy_scale"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "price_cents",    default: 0, null: false
    t.index ["truck_id"], name: "index_meals_on_truck_id", using: :btree
  end

  create_table "registrations", force: :cascade do |t|
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
    t.index ["email"], name: "index_registrations_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_registrations_on_reset_password_token", unique: true, using: :btree
  end

  create_table "truck_order_lists", force: :cascade do |t|
    t.integer  "truck_id"
    t.date     "date"
    t.datetime "time"
    t.integer  "total_day_income"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["truck_id"], name: "index_truck_order_lists_on_truck_id", using: :btree
  end

  create_table "trucks", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "type_of_food"
    t.boolean  "pay_online"
    t.string   "payment_info"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_trucks_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "role"
    t.integer  "registration_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["registration_id"], name: "index_users_on_registration_id", using: :btree
  end

  add_foreign_key "addresses", "trucks"
  add_foreign_key "baskets", "truck_order_lists"
  add_foreign_key "baskets", "trucks"
  add_foreign_key "baskets", "users"
  add_foreign_key "calendars", "addresses"
  add_foreign_key "calendars", "trucks"
  add_foreign_key "choices", "baskets"
  add_foreign_key "choices", "meals"
  add_foreign_key "choices", "users"
  add_foreign_key "meals", "trucks"
  add_foreign_key "truck_order_lists", "trucks"
  add_foreign_key "trucks", "users"
  add_foreign_key "users", "registrations"
end
