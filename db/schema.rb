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

ActiveRecord::Schema.define(version: 2018_05_18_171629) do

  create_table "customers", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "tabulation"
  end

  create_table "drinks", force: :cascade do |t|
    t.string "name"
    t.float "price"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "server_id"
    t.integer "customer_id"
    t.integer "drink_ids"
  end

  create_table "servers", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "pending_orders"
    t.integer "completed_orders"
  end

end
