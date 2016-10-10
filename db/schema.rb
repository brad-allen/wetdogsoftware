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

ActiveRecord::Schema.define(version: 20161010013545) do

  create_table "accounts", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "calendar_events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "event_contact"
    t.datetime "event_start"
    t.datetime "event_end"
    t.boolean  "all_day"
    t.string   "group_visibility",      default: "hidden"
    t.string   "connection_visibility", default: "read"
    t.string   "users_visibility",      default: "hidden"
    t.string   "public_visibility",     default: "hidden"
    t.string   "rating",                default: "unrated"
    t.string   "status"
    t.integer  "profile_id"
    t.integer  "group_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["group_id"], name: "index_calendar_events_on_group_id"
    t.index ["profile_id"], name: "index_calendar_events_on_profile_id"
  end

  create_table "comment_widgets", force: :cascade do |t|
    t.integer  "post_id"
    t.boolean  "allow_api_access"
    t.string   "description"
    t.integer  "current_score"
    t.integer  "commenter_count"
    t.integer  "voter_count"
    t.string   "status"
    t.string   "group_visibility",      default: "read"
    t.string   "connection_visibility", default: "read"
    t.string   "users_visibility",      default: "read"
    t.string   "public_visibility",     default: "hidden"
    t.string   "rating",                default: "unrated"
    t.integer  "widget_style_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["post_id"], name: "index_comment_widgets_on_post_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "comment_widget_id"
    t.string   "content"
    t.integer  "vote_score"
    t.boolean  "upvote"
    t.boolean  "downvote"
    t.integer  "flag_count"
    t.string   "status"
    t.string   "group_visibility",      default: "read"
    t.string   "connection_visibility", default: "read"
    t.string   "users_visibility",      default: "read"
    t.string   "public_visibility",     default: "hidden"
    t.string   "rating",                default: "unrated"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["comment_widget_id"], name: "index_comments_on_comment_widget_id"
    t.index ["profile_id"], name: "index_comments_on_profile_id"
  end

  create_table "connection_invites", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "connection_profile_id"
    t.string   "status"
    t.datetime "invited_at"
    t.datetime "reinvited_at"
    t.datetime "rejected_at"
    t.datetime "accepted_at"
    t.datetime "approved_at"
    t.integer  "approved_by"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["connection_profile_id"], name: "index_connection_invites_on_connection_profile_id"
    t.index ["profile_id"], name: "index_connection_invites_on_profile_id"
  end

  create_table "connections", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "connection_profile_id"
    t.string   "status"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["connection_profile_id"], name: "index_connections_on_connection_profile_id"
    t.index ["profile_id"], name: "index_connections_on_profile_id"
  end

  create_table "conversation_invites", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "profile_id"
    t.integer  "invited_profile_id"
    t.string   "status"
    t.datetime "invited_at"
    t.datetime "reinvited_at"
    t.datetime "rejected_at"
    t.datetime "accepted_at"
    t.datetime "approved_at"
    t.integer  "approved_by"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["conversation_id"], name: "index_conversation_invites_on_conversation_id"
    t.index ["invited_profile_id"], name: "index_conversation_invites_on_invited_profile_id"
    t.index ["profile_id"], name: "index_conversation_invites_on_profile_id"
  end

  create_table "conversation_members", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "profile_id"
    t.string   "status"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_conversation_members_on_conversation_id"
    t.index ["profile_id"], name: "index_conversation_members_on_profile_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "title"
    t.boolean  "allow_html"
    t.string   "status"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_conversations_on_profile_id"
  end

  create_table "field_details", force: :cascade do |t|
    t.string   "name"
    t.string   "field_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_actions", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "profile_id"
    t.string   "action"
    t.string   "description"
    t.string   "group_visibility",      default: "read"
    t.string   "connection_visibility", default: "read"
    t.string   "users_visibility",      default: "read"
    t.string   "public_visibility",     default: "hidden"
    t.string   "rating",                default: "unrated"
    t.string   "status"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["group_id"], name: "index_group_actions_on_group_id"
    t.index ["profile_id"], name: "index_group_actions_on_profile_id"
  end

  create_table "group_invites", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "profile_id"
    t.string   "status"
    t.datetime "invited_at"
    t.datetime "reinvited_at"
    t.datetime "rejected_at"
    t.datetime "accepted_at"
    t.datetime "approved_at"
    t.integer  "approved_by"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "is_admin"
    t.boolean  "can_post"
    t.boolean  "can_add_events"
    t.boolean  "can_comment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["group_id"], name: "index_group_invites_on_group_id"
    t.index ["profile_id"], name: "index_group_invites_on_profile_id"
  end

  create_table "group_members", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "profile_id"
    t.string   "status"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "is_admin"
    t.boolean  "can_post"
    t.boolean  "can_add_events"
    t.boolean  "can_comment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["group_id"], name: "index_group_members_on_group_id"
    t.index ["profile_id"], name: "index_group_members_on_profile_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "profile_id"
    t.string   "description"
    t.string   "status"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "group_visibility",      default: "hidden"
    t.string   "connection_visibility", default: "read"
    t.string   "users_visibility",      default: "hidden"
    t.string   "public_visibility",     default: "hidden"
    t.string   "rating",                default: "unrated"
    t.string   "group_type"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["profile_id"], name: "index_groups_on_profile_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "profile_id"
    t.string   "content"
    t.string   "status"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["profile_id"], name: "index_messages_on_profile_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "calendar_event_id"
    t.string   "notification_text"
    t.string   "importance"
    t.string   "status"
    t.integer  "sleep_count"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["calendar_event_id"], name: "index_notifications_on_calendar_event_id"
  end

  create_table "pages", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "group_id"
    t.string   "name"
    t.string   "description"
    t.integer  "page_order"
    t.string   "status"
    t.string   "group_visibility",      default: "read"
    t.string   "connection_visibility", default: "read"
    t.string   "users_visibility",      default: "read"
    t.string   "public_visibility",     default: "hidden"
    t.string   "rating",                default: "unrated"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["group_id"], name: "index_pages_on_group_id"
    t.index ["profile_id"], name: "index_pages_on_profile_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "group_id"
    t.integer  "page_id"
    t.string   "group_visibility",      default: "hidden"
    t.string   "connection_visibility", default: "read"
    t.string   "users_visibility",      default: "hidden"
    t.string   "public_visibility",     default: "hidden"
    t.string   "rating",                default: "unrated"
    t.string   "post_type"
    t.string   "content"
    t.string   "image"
    t.string   "thumb_image"
    t.string   "status"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["group_id"], name: "index_posts_on_group_id"
    t.index ["page_id"], name: "index_posts_on_page_id"
    t.index ["profile_id"], name: "index_posts_on_profile_id"
  end

  create_table "profile_actions", force: :cascade do |t|
    t.integer  "profile_id"
    t.string   "action"
    t.string   "description"
    t.string   "group_visibility",      default: "hidden"
    t.string   "connection_visibility", default: "read"
    t.string   "users_visibility",      default: "hidden"
    t.string   "public_visibility",     default: "hidden"
    t.string   "rating",                default: "unrated"
    t.string   "status"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["profile_id"], name: "index_profile_actions_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "profile_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "unique_name"
    t.string   "profile_responsibility_date"
    t.string   "status"
    t.string   "avatar"
    t.string   "gravatar_url"
    t.string   "bio"
    t.string   "state"
    t.string   "country"
    t.string   "tagline"
    t.string   "theme_music"
    t.datetime "birth_date"
    t.string   "email"
    t.boolean  "require_connection_approval",   default: true
    t.boolean  "require_conversation_approval", default: true
    t.boolean  "require_group_approval",        default: true
    t.boolean  "require_post_approval",         default: true
    t.boolean  "require_comment_approval",      default: true
    t.boolean  "can_view_non_connection_posts", default: false
    t.boolean  "show_comments",                 default: false
    t.boolean  "show_votes",                    default: true
    t.boolean  "inform_user_of_actions",        default: true
    t.boolean  "allow_commenting",              default: false
    t.boolean  "allow_voting",                  default: true
    t.boolean  "allow_emails",                  default: false
    t.string   "group_visibility",              default: "read"
    t.string   "connection_visibility",         default: "read"
    t.string   "users_visibility",              default: "read"
    t.string   "public_visibility",             default: "hidden"
    t.string   "rating",                        default: "unrated"
    t.string   "allowed_rating",                default: "G"
    t.string   "permission"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "username"
    t.string   "avatar"
    t.string   "gravatar_url"
    t.string   "status"
    t.string   "permission"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "vote_options", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "value"
    t.string   "image"
    t.integer  "widget_style_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["widget_style_id"], name: "index_vote_options_on_widget_style_id"
  end

  create_table "widget_styles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "style_data"
    t.string   "status"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
