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

ActiveRecord::Schema.define(version: 20130815220358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree

  create_table "ingredient_in_recipes", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.integer  "amount"
    t.string   "unit"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "ingredient_in_recipes", ["ingredient_id"], name: "index_ingredient_in_recipes_on_ingredient_id", using: :btree
  add_index "ingredient_in_recipes", ["recipe_id"], name: "index_ingredient_in_recipes_on_recipe_id", using: :btree

  create_table "ingredient_in_steps", force: true do |t|
    t.integer  "step_id"
    t.integer  "ingredient_id"
    t.integer  "amount"
    t.string   "unit"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "ingredient_in_steps", ["ingredient_id"], name: "index_ingredient_in_steps_on_ingredient_id", using: :btree
  add_index "ingredient_in_steps", ["step_id"], name: "index_ingredient_in_steps_on_step_id", using: :btree

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "steps", force: true do |t|
    t.integer  "order"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "recipe_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
