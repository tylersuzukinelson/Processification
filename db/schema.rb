# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161005200547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "estimation_participants", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "estimation_session_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "estimation_participants", ["estimation_session_id"], name: "index_estimation_participants_on_estimation_session_id", using: :btree
  add_index "estimation_participants", ["user_id"], name: "index_estimation_participants_on_user_id", using: :btree

  create_table "estimation_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estimation_tickets", force: :cascade do |t|
    t.integer  "estimation_session_id"
    t.string   "ticket"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "estimation_tickets", ["estimation_session_id"], name: "index_estimation_tickets_on_estimation_session_id", using: :btree

  create_table "retro_items", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "retro_session_id"
    t.text     "body"
    t.integer  "category"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "retro_items", ["retro_session_id"], name: "index_retro_items_on_retro_session_id", using: :btree
  add_index "retro_items", ["user_id"], name: "index_retro_items_on_user_id", using: :btree

  create_table "retro_participants", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "retro_session_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "retro_participants", ["retro_session_id"], name: "index_retro_participants_on_retro_session_id", using: :btree
  add_index "retro_participants", ["user_id"], name: "index_retro_participants_on_user_id", using: :btree

  create_table "retro_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ticket_votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "estimation_ticket_id"
    t.integer  "value"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "vote_note_id"
  end

  add_index "ticket_votes", ["estimation_ticket_id"], name: "index_ticket_votes_on_estimation_ticket_id", using: :btree
  add_index "ticket_votes", ["user_id"], name: "index_ticket_votes_on_user_id", using: :btree
  add_index "ticket_votes", ["vote_note_id"], name: "index_ticket_votes_on_vote_note_id", using: :btree

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vote_notes", force: :cascade do |t|
    t.integer  "ticket_vote_id"
    t.text     "note"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "vote_notes", ["ticket_vote_id"], name: "index_vote_notes_on_ticket_vote_id", using: :btree

  add_foreign_key "estimation_participants", "estimation_sessions"
  add_foreign_key "estimation_participants", "users"
  add_foreign_key "estimation_tickets", "estimation_sessions"
  add_foreign_key "retro_items", "retro_sessions"
  add_foreign_key "retro_items", "users"
  add_foreign_key "retro_participants", "retro_sessions"
  add_foreign_key "retro_participants", "users"
  add_foreign_key "ticket_votes", "estimation_tickets"
  add_foreign_key "ticket_votes", "users"
  add_foreign_key "ticket_votes", "vote_notes"
  add_foreign_key "vote_notes", "ticket_votes"
end
