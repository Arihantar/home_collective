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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120119130817) do

  create_table "admins", :force => true do |t|
    t.string   "email",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cart_items", :force => true do |t|
    t.integer "cart_id"
    t.integer "product_id"
    t.integer "quantity",   :null => false
  end

  add_index "cart_items", ["cart_id"], :name => "index_cart_items_on_cart_id"
  add_index "cart_items", ["product_id"], :name => "index_cart_items_on_product_id"

  create_table "carts", :force => true do |t|
    t.integer "total_quantity",                                :null => false
    t.decimal "total_price",    :precision => 10, :scale => 0, :null => false
    t.integer "user_id"
  end

  add_index "carts", ["user_id"], :name => "index_carts_on_user_id"

  create_table "cities", :force => true do |t|
    t.string  "name",     :null => false
    t.integer "state_id"
  end

  add_index "cities", ["state_id"], :name => "index_cities_on_state_id"

  create_table "complaints", :force => true do |t|
    t.integer  "order_id"
    t.text     "problem",                           :null => false
    t.string   "status",     :default => "PENDING", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "complaints", ["order_id"], :name => "index_complaints_on_order_id"

  create_table "countries", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "coupon_codes", :force => true do |t|
    t.string   "name",                :null => false
    t.datetime "validity_start_date", :null => false
    t.datetime "validity_end_date"
    t.integer  "discount",            :null => false
    t.integer  "admin_id"
    t.boolean  "is_for_total_amount", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coupon_codes", ["admin_id"], :name => "index_coupon_codes_on_admin_id"

  create_table "deliveries", :force => true do |t|
    t.integer  "order_id"
    t.string   "tracking_code"
    t.string   "status",        :default => "NOT SHIPPED", :null => false
    t.datetime "shipped_at"
    t.datetime "received_at"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deliveries", ["admin_id"], :name => "index_deliveries_on_admin_id"
  add_index "deliveries", ["order_id"], :name => "index_deliveries_on_order_id"

  create_table "enquiries", :force => true do |t|
    t.string   "email",          :null => false
    t.string   "contact_number", :null => false
    t.text     "content",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", :force => true do |t|
    t.text     "desciption",  :null => false
    t.integer  "delivery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feedbacks", ["delivery_id"], :name => "index_feedbacks_on_delivery_id"

  create_table "images", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "product_id"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["admin_id"], :name => "index_images_on_admin_id"
  add_index "images", ["product_id"], :name => "index_images_on_product_id"

  create_table "order_items", :force => true do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.integer "quantity",   :null => false
  end

  add_index "order_items", ["order_id"], :name => "index_order_items_on_order_id"
  add_index "order_items", ["product_id"], :name => "index_order_items_on_product_id"

  create_table "orders", :force => true do |t|
    t.string   "type",                                          :default => "NORMAL", :null => false
    t.integer  "total_quantity",                                                      :null => false
    t.decimal  "total_price",    :precision => 10, :scale => 0,                       :null => false
    t.string   "pay_type",                                                            :null => false
    t.string   "recipient",                                                           :null => false
    t.text     "address",                                                             :null => false
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "pincode",                                                             :null => false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["city_id"], :name => "index_orders_on_city_id"
  add_index "orders", ["state_id"], :name => "index_orders_on_state_id"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "page_requests", :force => true do |t|
    t.string   "path"
    t.integer  "page_duration"
    t.integer  "db_duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name",                                              :null => false
    t.string   "product_code",                                      :null => false
    t.text     "description",                                       :null => false
    t.decimal  "price",              :precision => 10, :scale => 0, :null => false
    t.integer  "discount"
    t.integer  "delivery_min_range"
    t.integer  "delivery_max_range"
    t.integer  "stock",                                             :null => false
    t.integer  "reorder_level",                                     :null => false
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["admin_id"], :name => "index_products_on_admin_id"

  create_table "purchases", :force => true do |t|
    t.integer  "product_id"
    t.decimal  "total_price", :precision => 10, :scale => 0, :null => false
    t.integer  "quantity",                                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["product_id"], :name => "index_purchases_on_product_id"

  create_table "reviews", :force => true do |t|
    t.text     "body",       :null => false
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["product_id"], :name => "index_reviews_on_product_id"
  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

  create_table "services", :force => true do |t|
    t.integer "user_id"
    t.string  "provider"
    t.string  "uid"
    t.string  "uname"
    t.string  "uemail"
  end

  add_index "services", ["user_id"], :name => "index_services_on_user_id"

  create_table "states", :force => true do |t|
    t.string  "name",       :null => false
    t.integer "country_id"
  end

  add_index "states", ["country_id"], :name => "index_states_on_country_id"

  create_table "static_pages", :force => true do |t|
    t.string   "name",       :null => false
    t.text     "content",    :null => false
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "static_pages", ["admin_id"], :name => "index_static_pages_on_admin_id"

  create_table "tags", :force => true do |t|
    t.string "name",   :null => false
    t.string "nature", :null => false
  end

  create_table "user_details", :force => true do |t|
    t.string  "label",    :null => false
    t.text    "address",  :null => false
    t.string  "pincode",  :null => false
    t.integer "state_id"
    t.integer "city_id"
    t.integer "user_id"
  end

  add_index "user_details", ["city_id"], :name => "index_user_details_on_city_id"
  add_index "user_details", ["state_id"], :name => "index_user_details_on_state_id"
  add_index "user_details", ["user_id"], :name => "index_user_details_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "first_name",      :null => false
    t.string   "last_name",       :null => false
    t.string   "email",           :null => false
    t.integer  "mobile_number",   :null => false
    t.integer  "landline_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"

  create_table "wishlists", :force => true do |t|
    t.integer "user_id"
    t.integer "product_id"
  end

  add_index "wishlists", ["product_id"], :name => "index_wishlists_on_product_id"
  add_index "wishlists", ["user_id"], :name => "index_wishlists_on_user_id"

end
