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

ActiveRecord::Schema.define(version: 20140426005228) do

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
    t.string   "valorconvenio"
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

  create_table "usuarios", force: true do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "email"
    t.string   "login"
    t.string   "senha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
