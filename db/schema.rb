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

ActiveRecord::Schema.define(version: 20161105043100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choferes", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "radio"
    t.integer  "taller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "choferes", ["taller_id"], name: "index_choferes_on_taller_id", using: :btree

  create_table "detalles", force: :cascade do |t|
    t.integer  "cantidad"
    t.string   "descripcion"
    t.integer  "detallable_id"
    t.string   "detallable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "unidad_id"
  end

  add_index "detalles", ["detallable_type", "detallable_id"], name: "index_detalles_on_detallable_type_and_detallable_id", using: :btree
  add_index "detalles", ["unidad_id"], name: "index_detalles_on_unidad_id", using: :btree

  create_table "direcciones", force: :cascade do |t|
    t.string   "calle"
    t.integer  "altura"
    t.integer  "direccionable_id"
    t.string   "direccionable_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "direcciones", ["direccionable_type", "direccionable_id"], name: "index_direcciones_on_direccionable_type_and_direccionable_id", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "taller_id"
    t.integer  "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "current"
  end

  add_index "memberships", ["role_id"], name: "index_memberships_on_role_id", using: :btree
  add_index "memberships", ["taller_id"], name: "index_memberships_on_taller_id", using: :btree
  add_index "memberships", ["usuario_id"], name: "index_memberships_on_usuario_id", using: :btree

  create_table "notas_pedidos", force: :cascade do |t|
    t.string   "numeroserie"
    t.date     "fecha"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "notas_reparaciones", force: :cascade do |t|
    t.string   "numeroserie"
    t.date     "fecha"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "proveedores", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "taller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "proveedores", ["taller_id"], name: "index_proveedores_on_taller_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "talleres", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner_id"
  end

  add_index "talleres", ["owner_id"], name: "index_talleres_on_owner_id", using: :btree

  create_table "turnos", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "taller_id"
  end

  add_index "turnos", ["taller_id"], name: "index_turnos_on_taller_id", using: :btree

  create_table "unidad_choferes", force: :cascade do |t|
    t.integer  "unidad_id"
    t.integer  "chofer_id"
    t.integer  "turno_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "unidad_choferes", ["chofer_id"], name: "index_unidad_choferes_on_chofer_id", using: :btree
  add_index "unidad_choferes", ["turno_id"], name: "index_unidad_choferes_on_turno_id", using: :btree
  add_index "unidad_choferes", ["unidad_id"], name: "index_unidad_choferes_on_unidad_id", using: :btree

  create_table "unidades", force: :cascade do |t|
    t.string   "patente"
    t.string   "marca"
    t.integer  "año"
    t.boolean  "fueraDeServicio"
    t.integer  "taller_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "unidades", ["taller_id"], name: "index_unidades_on_taller_id", using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "usuarios", ["confirmation_token"], name: "index_usuarios_on_confirmation_token", unique: true, using: :btree
  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["invitation_token"], name: "index_usuarios_on_invitation_token", unique: true, using: :btree
  add_index "usuarios", ["invitations_count"], name: "index_usuarios_on_invitations_count", using: :btree
  add_index "usuarios", ["invited_by_id"], name: "index_usuarios_on_invited_by_id", using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "choferes", "talleres"
  add_foreign_key "detalles", "unidades"
  add_foreign_key "memberships", "roles", column: "role_id"
  add_foreign_key "memberships", "talleres"
  add_foreign_key "memberships", "usuarios"
  add_foreign_key "proveedores", "talleres"
  add_foreign_key "turnos", "talleres"
  add_foreign_key "unidad_choferes", "choferes"
  add_foreign_key "unidad_choferes", "turnos"
  add_foreign_key "unidad_choferes", "unidades"
  add_foreign_key "unidades", "talleres"
end
