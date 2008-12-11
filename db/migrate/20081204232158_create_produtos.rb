class CreateProdutos < ActiveRecord::Migration

  def self.up
    create_table :produtos do |t|
      t.string :param, :null => false
      t.string :descricao, :null => false
      t.decimal :custo_unitario, :precision => 16, :scale => 2, :null => false
      t.decimal :preco_unitario, :precision => 16, :scale => 2, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :produtos
  end

end
