class CreateVendas < ActiveRecord::Migration

  def self.up

    create_table :vendas do |t|
      t.date :data, :null => false
      t.integer :ordem
      t.string :descricao
      t.decimal :quantidade, :precision => 16, :scale => 2, :null => false
      t.decimal :custo_unitario, :precision => 16, :scale => 2, :null => false
      t.decimal :valor_total, :precision => 16, :scale => 2, :null => false
      t.integer :produto_id

      t.timestamps
    end
    add_index :vendas, :data
    add_index :vendas, :produto_id

  end

  def self.down
    drop_table :vendas
  end
  
end
