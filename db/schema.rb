# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_19_191600) do
  create_table "axe_details", force: :cascade do |t|
    t.text "url"
    t.text "rule_type"
    t.text "result_type"
    t.text "result_condition"
    t.integer "result_condition_index"
    t.text "rule_set"
    t.text "impact"
    t.text "message"
    t.text "html_element"
    t.text "dom_element"
    t.text "help"
    t.text "help_url"
    t.text "wcag_criteria"
    t.text "axe_version"
    t.datetime "version", precision: nil
  end

  create_table "axes", force: :cascade do |t|
    t.text "url", null: false
    t.text "criteria"
    t.text "level"
    t.text "result"
    t.datetime "version", precision: nil
  end

  create_table "waves", force: :cascade do |t|
    t.text "url"
    t.text "keys"
    t.boolean "successful"
    t.integer "wcag_errors", default: 0
    t.integer "contrast_errors", default: 0
    t.integer "aria_elements", default: 0
    t.integer "text_length", default: 0
    t.datetime "version", precision: nil
  end

  create_table "wcag_rules", force: :cascade do |t|
    t.text "key"
    t.text "description"
    t.text "url"
  end

end
