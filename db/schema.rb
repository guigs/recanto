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

ActiveRecord::Schema.define(:version => 20081204232355) do

  create_table "produtos", :force => true do |t|
    t.string   "param",                                         :null => false
    t.string   "descricao",                                     :null => false
    t.decimal  "custo_unitario", :precision => 16, :scale => 2, :null => false
    t.decimal  "preco_unitario", :precision => 16, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendas", :force => true do |t|
    t.date     "data",                                          :null => false
    t.integer  "ordem"
    t.string   "descricao"
    t.decimal  "quantidade",     :precision => 16, :scale => 2, :null => false
    t.decimal  "custo_unitario", :precision => 16, :scale => 2, :null => false
    t.decimal  "valor_total",    :precision => 16, :scale => 2, :null => false
    t.integer  "produto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vendas", ["data"], :name => "index_vendas_on_data"
  add_index "vendas", ["produto_id"], :name => "index_vendas_on_produto_id"

end
