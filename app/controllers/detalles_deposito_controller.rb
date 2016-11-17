class DetallesDepositoController < ApplicationController
  before_action :set_detalle, only: [:show, :edit, :update, :destroy]

  # GET /detalles_deposito
  # GET /detalles_deposito.json
  def index
    @detalles = DetalleDeposito.all
  end

  # GET /detalles_deposito/1
  # GET /detalles_deposito/1.json
  def show
  end

  # GET /detalles_deposito/new
  def new
    @detalle = DetalleDeposito.new
  end

  # GET /detalles_deposito/1/edit
  def edit
  end

  # POST /detalles_deposito
  # POST /detalles_deposito.json
  def create
    @detalle = DetalleDeposito.new(detalle_params)

    respond_to do |format|
      if @detalle.save
        format.html { redirect_to @detalle, notice: 'Detalle was successfully created.' }
        format.json { render :show, status: :created, location: @detalle }
      else
        format.html { render :new }
        format.json { render json: @detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalles_deposito/1
  # PATCH/PUT /detalles_deposito/1.json
  def update
    respond_to do |format|
      if @detalle.update(detalle_params)
        format.html { redirect_to @detalle, notice: 'Detalle was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle }
      else
        format.html { render :edit }
        format.json { render json: @detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalles_deposito/1
  # DELETE /detalles_deposito/1.json
  def destroy
    @detalle.destroy
    respond_to do |format|
      format.html { redirect_to detalles_url, notice: 'Detalle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle
      @detalle = DetalleDeposito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_params
      params.require(:detalle).permit(:cantidad)
    end
end
