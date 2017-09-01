# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "addresses", :force => true do |t|
    t.string   "address_line_1",      :limit => 50
    t.string   "address_line_2",      :limit => 50
    t.string   "city",                :limit => 50
    t.integer  "state_id"
    t.string   "foreign_post_region", :limit => 50
    t.integer  "country_id",                        :default => 1, :null => false
    t.datetime "created_on",                                       :null => false
    t.datetime "updated_on",                                       :null => false
    t.string   "zip",                 :limit => 15
  end

  create_table "associate_types", :force => true do |t|
    t.string "description", :limit => 254, :null => false
  end

  create_table "associates", :force => true do |t|
    t.integer  "associate_type_id",                  :null => false
    t.integer  "organization_id"
    t.string   "title",               :limit => 254
    t.integer  "prefix_id"
    t.string   "first_name",          :limit => 25
    t.string   "middle_name",         :limit => 25
    t.string   "last_name",           :limit => 50,  :null => false
    t.string   "suffix",              :limit => 25
    t.string   "gender",              :limit => 1
    t.integer  "address_id"
    t.string   "phone",               :limit => 25
    t.string   "email",               :limit => 254
    t.integer  "security_role_id",                   :null => false
    t.string   "userid",              :limit => 25
    t.string   "password",            :limit => 25
    t.date     "start_date"
    t.date     "termination_date"
    t.string   "thumbnail_file_name", :limit => 254
    t.string   "image_file_name",     :limit => 254
    t.datetime "created_on",                         :null => false
    t.datetime "updated_on",                         :null => false
  end

  add_index "associates", ["userid"], :name => "associates_userid", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name",                :limit => 128,                     :null => false
    t.string   "description",         :limit => 254
    t.string   "notes",               :limit => 7000
    t.boolean  "exclude",                             :default => false, :null => false
    t.string   "thumbnail_file_name", :limit => 254
    t.string   "image_file_name",     :limit => 254
    t.datetime "created_on",                                             :null => false
    t.datetime "updated_on",                                             :null => false
  end

  create_table "countries", :force => true do |t|
    t.string "name", :limit => 254, :null => false
  end

  create_table "organization_categories", :force => true do |t|
    t.integer "organization_id", :null => false
    t.integer "category_id",     :null => false
  end

  add_index "organization_categories", ["category_id", "organization_id"], :name => "organization_categories_ukey", :unique => true

  create_table "organizations", :force => true do |t|
    t.string   "name",                :limit => 254, :null => false
    t.integer  "address_id"
    t.string   "phone",               :limit => 25
    t.string   "email",               :limit => 254
    t.string   "thumbnail_file_name", :limit => 254
    t.string   "image_file_name",     :limit => 254
    t.datetime "created_on",                         :null => false
    t.datetime "updated_on",                         :null => false
    t.string   "fax",                 :limit => 25
    t.string   "toll_free_phone",     :limit => 25
  end

  create_table "products", :force => true do |t|
    t.integer  "category_id",                                                                           :null => false
    t.string   "product_number",      :limit => 64,                                                     :null => false
    t.string   "name",                :limit => 128,                                                    :null => false
    t.string   "description",         :limit => 254
    t.decimal  "unit_price",                          :precision => 15, :scale => 2
    t.string   "notes",               :limit => 7000
    t.boolean  "exclude",                                                            :default => false, :null => false
    t.string   "thumbnail_file_name", :limit => 254
    t.string   "image_file_name",     :limit => 254
    t.datetime "created_on",                                                                            :null => false
    t.datetime "updated_on",                                                                            :null => false
    t.string   "length",              :limit => 64
    t.string   "hole_size",           :limit => 64
  end

  add_index "products", ["category_id"], :name => "fki_products_category"
  add_index "products", ["product_number"], :name => "products_ukey", :unique => true

  create_table "security_roles", :force => true do |t|
    t.string   "description",    :limit => 254,                :null => false
    t.integer  "security_level", :limit => 2,   :default => 0, :null => false
    t.datetime "created_on",                                   :null => false
    t.datetime "updated_on",                                   :null => false
  end

  create_table "states", :force => true do |t|
    t.string "state", :limit => 2,   :null => false
    t.string "name",  :limit => 254, :null => false
  end

  add_index "states", ["state"], :name => "states_code_uniq", :unique => true

  create_table "website_item_types", :force => true do |t|
    t.string "desription", :limit => 254, :null => false
  end

  create_table "website_items", :force => true do |t|
    t.integer  "website_id",                           :null => false
    t.integer  "website_item_type_id",                 :null => false
    t.date     "start_date",                           :null => false
    t.date     "end_date",                             :null => false
    t.string   "title",                :limit => 128,  :null => false
    t.string   "description",          :limit => 7000, :null => false
    t.string   "url",                  :limit => 254
    t.string   "email",                :limit => 254
    t.datetime "created_on",                           :null => false
    t.datetime "updated_on",                           :null => false
    t.string   "email_label",          :limit => 128
  end

  create_table "websites", :force => true do |t|
    t.string   "name",            :limit => 254, :null => false
    t.string   "support_email",   :limit => 254
    t.integer  "organization_id"
    t.string   "url",             :limit => 254
    t.datetime "created_on",                     :null => false
    t.datetime "updated_on",                     :null => false
  end

end
