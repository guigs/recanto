class Venda < ActiveRecord::Base

  #def initialize(data)
  #  super
  #  self.quantidade = 1
  #  self.data = data
  #end

  def custo_total
    custo_unitario * quantidade
  end
  
  def margem_contribuicao
    valor_total - custo_total
  end
  
  def valor_unitario
    valor_total / quantidade
  end
  
  def margem_percentual
    margem_contribuicao / custo_total
  end

  def parse_form(f)
    if f.has_key?(:descricao)
      self.descricao = f[:descricao]
    end
    if f.has_key?(:quantidade)
      self.quantidade = f[:quantidade].gsub(',','.').to_f
    end
    if f.has_key?(:data)
      self.data = f[:data]
    end
    if f.has_key?(:custo_unitario)
      self.custo_unitario = f[:custo_unitario].gsub(',','.').to_f
    end
    if f.has_key?(:valor_total)
      self.valor_total = f[:valor_total].gsub(',','.').to_f
    end
  end

end
