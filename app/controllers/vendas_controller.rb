class VendasController < ApplicationController
  # GET /vendas
  # GET /vendas.xml

  def index
    unless (data = params[:date]).nil?
      redirect_to(
        :action => 'lista',
        :dia => data[:day],
        :mes => data[:month],
        :ano => data[:year]
      )
      return
    end
  end
#  def index
#    @vendas = Venda.find(:all)
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @vendas }
#    end
#  end

  def mensal
    unless (data = params[:date]).nil?
      redirect_to(:action => 'mensal', :ano => data[:year])
      return
    end
    @ano = params[:ano]
    @meses = Venda.find_by_sql " select
      sum(valor_total) faturamento, sum(custo_unitario*quantidade) custo, count(distinct DAY(data)) dias, MONTH(data) mes
      from vendas
      where YEAR(data) = #{@ano}
      group by MONTH(data)
      order by MONTH(data)
    "
  end

  def lista
    @data = Date.civil(params[:ano].to_i, params[:mes].to_i, params[:dia].to_i)
    @data_proxima = @data + 1
    @data_anterior = @data - 1
    @vendas = Venda.find_all_by_data(@data, :order=>:id)
    @total = Venda.new(
      :data => @data,
      :quantidade => 1,
      :custo_unitario => 0,
      :valor_total => 0
    )
    @venda = Venda.new(
      :data => @data,
      :quantidade => 1
    )
  end

  # GET /vendas/1
  # GET /vendas/1.xml
  def show
    @venda = Venda.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @venda }
    end
  end

  # GET /vendas/new
  # GET /vendas/new.xml
  def new
    @venda = Venda.new(:data=>params[:data])
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @venda }
    end
  end

  # GET /vendas/1/edit
  def edit
    @venda = Venda.find(params[:id])
  end

  # POST /vendas
  # POST /vendas.xml
  def create
    @venda = Venda.new
    @venda.parse_form(params[:venda])
    respond_to do |format|
      if @venda.save
        flash[:notice] = 'Venda cadastrada com sucesso.'
        format.html { redirect_to(:action => :lista, :dia => @venda.data.day, :mes => @venda.data.month, :ano => @venda.data.year) }
        format.xml  { render :xml => @venda, :status => :created, :location => @venda }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @venda.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vendas/1
  # PUT /vendas/1.xml
  def update
    @venda = Venda.find(params[:id])
    respond_to do |format|
      @venda.parse_form(params[:venda])
      if @venda.save
        flash[:notice] = 'Venda atualizada com sucesso.'
        format.html { redirect_to(:action => :lista, :dia => @venda.data.day, :mes => @venda.data.month, :ano => @venda.data.year) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @venda.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vendas/1
  # DELETE /vendas/1.xml
  def destroy
    @venda = Venda.find(params[:id])
    data = @venda.data
    @venda.destroy

    respond_to do |format|
      flash[:notice] = 'Venda excluída.'
      format.html { redirect_to(:action => :lista, :dia => data.day, :mes => data.month, :ano => data.year) }
      format.xml  { head :ok }
    end
  end

end
