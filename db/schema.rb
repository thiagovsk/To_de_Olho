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

ActiveRecord::Schema.define(version: 20140613200930) do

  create_table "abaixo_assinados", force: true do |t|
    t.integer  "usuario_id"
    t.string   "titulo"
    t.string   "destinatario"
    t.text     "termo"
    t.integer  "convenio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "abaixo_assinados", ["convenio_id"], name: "index_abaixo_assinados_on_convenio_id"
  add_index "abaixo_assinados", ["usuario_id"], name: "index_abaixo_assinados_on_usuario_id"

  create_table "assinaturas", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "abaixo_assinado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "convenios", force: true do |t|
    t.string   "numeroconvenio"
    t.string   "uf"
    t.string   "codigosiafi"
    t.string   "nomemunicipio"
    t.string   "situacaoconvenio"
    t.string   "numerooriginal"
    t.string   "objetoconvenio"
    t.string   "codigoorgaosuperior"
    t.string   "nomeorgaosuperior"
    t.string   "codigoconcedente"
    t.string   "nomeconcedente"
    t.string   "codigoconvenente"
    t.string   "nomeconvenente"
    t.string   "tipoenteconvenente"
    t.float    "valorconvenio"
    t.string   "valorliberado"
    t.string   "datapublicacao"
    t.string   "datainiciovigencia"
    t.string   "datafimvigencia"
    t.string   "valorcontrapartida"
    t.string   "dataultimaliberacao"
    t.string   "valorultimaliberacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reclamacaos", force: true do |t|
    t.text     "descricao"
    t.integer  "convenio_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
  end

  add_index "reclamacaos", ["convenio_id"], name: "index_reclamacaos_on_convenio_id"
  add_index "reclamacaos", ["usuario_id"], name: "index_reclamacaos_on_usuario_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "usuarios", force: true do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "login"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true

  create_table "usuarios_roles", id: false, force: true do |t|
    t.integer "usuario_id"
    t.integer "role_id"
  end

  add_index "usuarios_roles", ["usuario_id", "role_id"], name: "index_usuarios_roles_on_usuario_id_and_role_id"

end
