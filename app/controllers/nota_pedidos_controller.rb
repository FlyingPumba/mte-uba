class NotaPedidosController < ApplicationController
  before_action :set_nota_pedido, only: [:show, :edit, :update, :destroy]

  # GET /notas_pedidos
  # GET /notas_pedidos.json
  def index
    @notas_pedidos = NotaPedido.all
  end

  # GET /notas_pedidos/1
  # GET /notas_pedidos/1.json
  def show
  end

  # GET /notas_pedidos/new
  def new
    @nota_pedido = NotaPedido.new
  end

  # GET /notas_pedidos/1/edit
  def edit
  end

  # POST /notas_pedidos
  # POST /notas_pedidos.json
  def create
    @nota_pedido = NotaPedido.new(nota_pedido_params)

    respond_to do |format|
      if @nota_pedido.save
        format.html { redirect_to @nota_pedido, notice: 'Nota pedido was successfully created.' }
        format.json { render :show, status: :created, location: @nota_pedido }
      else
        format.html { render :new }
        format.json { render json: @nota_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notas_pedidos/1
  # PATCH/PUT /notas_pedidos/1.json
  def update
    respond_to do |format|
      if @nota_pedido.update(nota_pedido_params)
        format.html { redirect_to @nota_pedido, notice: 'Nota pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @nota_pedido }
      else
        format.html { render :edit }
        format.json { render json: @nota_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notas_pedidos/1
  # DELETE /notas_pedidos/1.json
  def destroy
    @nota_pedido.destroy
    respond_to do |format|
      format.html { redirect_to notas_pedidos_url, notice: 'Nota pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nota_pedido
      @nota_pedido = NotaPedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nota_pedido_params
      params.require(:nota_pedido).permit(:numeroserie, :fecha)
    end
end
