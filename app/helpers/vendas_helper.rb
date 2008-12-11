module VendasHelper

  def formata_lucro(venda)
    h "#{number_to_currency(venda.margem_contribuicao)} (#{number_to_percentage(100*venda.margem_percentual, :precision => 0)})"
  end

end
