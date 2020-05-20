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

ActiveRecord::Schema.define(version: 2020_05_20_020840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "currency_id"
    t.uuid "country_id"
    t.string "category"
    t.string "name"
    t.string "icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "platform_id"
    t.index ["country_id"], name: "index_accounts_on_country_id"
    t.index ["currency_id"], name: "index_accounts_on_currency_id"
    t.index ["platform_id"], name: "index_accounts_on_platform_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "countries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "iso_code"
    t.string "continent"
    t.uuid "currency_id"
    t.string "flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "fiscal_year_start"
    t.index ["currency_id"], name: "index_countries_on_currency_id"
  end

  create_table "currencies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "symbol"
    t.integer "decimal_places"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "kind"
    t.float "fx_eur"
  end

  create_table "loans", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "country_id"
    t.uuid "currency_id"
    t.uuid "originator_id"
    t.uuid "platform_id"
    t.string "code"
    t.string "internal_code"
    t.string "name"
    t.string "borrower"
    t.string "gender"
    t.float "air"
    t.string "status"
    t.float "xirr"
    t.string "rating"
    t.float "dti_rating"
    t.string "borrower_type"
    t.string "category"
    t.float "amount"
    t.text "description"
    t.string "link"
    t.boolean "secured_buyback"
    t.boolean "secured_personal"
    t.boolean "secured_collaretal"
    t.text "security"
    t.date "date_listed"
    t.date "date_issued"
    t.date "date_maturity"
    t.string "amortization"
    t.string "installment"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_loans_on_country_id"
    t.index ["currency_id"], name: "index_loans_on_currency_id"
    t.index ["originator_id"], name: "index_loans_on_originator_id"
    t.index ["platform_id"], name: "index_loans_on_platform_id"
  end

  create_table "originators", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "product_type_individuals"
    t.string "product_type_companies"
    t.string "length"
    t.float "default_rate"
    t.float "air"
    t.float "xirr"
    t.string "rating"
    t.float "apr"
    t.string "logo"
    t.string "icon"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "customer_category"
  end

  create_table "platform_originators", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "originator_id"
    t.uuid "platform_id"
    t.string "status"
    t.float "skin_game"
    t.integer "grace_period"
    t.string "rating"
    t.string "length"
    t.float "apr"
    t.string "structure"
    t.text "notes"
    t.string "buyback"
    t.boolean "buyback_principal"
    t.boolean "buyback_interest"
    t.integer "buyback_activation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["originator_id"], name: "index_platform_originators_on_originator_id"
    t.index ["platform_id"], name: "index_platform_originators_on_platform_id"
  end

  create_table "platforms", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "contact_id"
    t.string "category"
    t.string "status"
    t.string "liquidity"
    t.string "term"
    t.text "invest_mode"
    t.string "min_investment"
    t.string "secondary_market"
    t.string "taxes"
    t.string "cashflow_options"
    t.string "protection_scheme"
    t.string "cost"
    t.boolean "profitable"
    t.boolean "ifisa"
    t.string "structure"
    t.string "account_category"
    t.string "welcome_bonus"
    t.string "promo"
    t.date "promo_end"
    t.string "icon"
    t.string "logo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_platforms_on_contact_id"
  end

  create_table "roles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.uuid "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  end

  create_table "user_accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "country_id"
    t.uuid "account_id"
    t.uuid "platform_id"
    t.uuid "currency_id"
    t.uuid "user_id"
    t.string "category"
    t.string "name"
    t.float "total_fee"
    t.float "total_loss"
    t.float "total_tax"
    t.boolean "active"
    t.float "total_invest"
    t.float "total_profit"
    t.float "total_referral"
    t.float "total_interest"
    t.float "total_bonus"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_user_accounts_on_account_id"
    t.index ["country_id"], name: "index_user_accounts_on_country_id"
    t.index ["currency_id"], name: "index_user_accounts_on_currency_id"
    t.index ["platform_id"], name: "index_user_accounts_on_platform_id"
    t.index ["user_id"], name: "index_user_accounts_on_user_id"
  end

  create_table "user_loans", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "country_id"
    t.uuid "loan_id"
    t.uuid "user_id"
    t.uuid "currency_id"
    t.uuid "originator_id"
    t.uuid "user_account_id"
    t.uuid "platform_id"
    t.string "slice_name"
    t.string "market"
    t.float "xirr"
    t.float "investment_amount"
    t.string "invest_mode"
    t.string "position"
    t.date "date_in"
    t.date "date_out"
    t.float "principal_remaining"
    t.float "interest"
    t.float "bonus"
    t.float "tax"
    t.float "loss"
    t.float "fee"
    t.string "contract_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_user_loans_on_country_id"
    t.index ["currency_id"], name: "index_user_loans_on_currency_id"
    t.index ["loan_id"], name: "index_user_loans_on_loan_id"
    t.index ["originator_id"], name: "index_user_loans_on_originator_id"
    t.index ["platform_id"], name: "index_user_loans_on_platform_id"
    t.index ["user_account_id"], name: "index_user_loans_on_user_account_id"
    t.index ["user_id"], name: "index_user_loans_on_user_id"
  end

  create_table "user_platforms", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "platform_id"
    t.text "overview"
    t.text "strategy"
    t.string "user"
    t.string "pass"
    t.string "internal_id"
    t.text "notes"
    t.integer "rating"
    t.float "xirr"
    t.float "total_loss"
    t.float "air"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["platform_id"], name: "index_user_platforms_on_platform_id"
    t.index ["user_id"], name: "index_user_platforms_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "username"
    t.string "image"
    t.string "email"
    t.uuid "currency_id"
    t.uuid "country_id"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "dob"
    t.string "name"
    t.string "surname"
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["currency_id"], name: "index_users_on_currency_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
