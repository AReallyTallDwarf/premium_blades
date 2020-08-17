# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_17_085029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "basket_blades", force: :cascade do |t|
    t.bigint "basket_id", null: false
    t.bigint "blade_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["basket_id"], name: "index_basket_blades_on_basket_id"
    t.index ["blade_id"], name: "index_basket_blades_on_blade_id"
  end

  create_table "baskets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_baskets_on_user_id"
  end

  create_table "blades", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 8, scale: 2
    t.boolean "pointy"
    t.integer "stock"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "catalogue_blades", force: :cascade do |t|
    t.bigint "basket_id", null: false
    t.bigint "blade_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["basket_id"], name: "index_catalogue_blades_on_basket_id"
    t.index ["blade_id"], name: "index_catalogue_blades_on_blade_id"
  end

  create_table "catalogues", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_catalogues_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "basket_blades", "baskets"
  add_foreign_key "basket_blades", "blades"
  add_foreign_key "baskets", "users"
  add_foreign_key "catalogue_blades", "baskets"
  add_foreign_key "catalogue_blades", "blades"
  add_foreign_key "catalogues", "users"
end
