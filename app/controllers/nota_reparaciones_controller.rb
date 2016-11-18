class NotaReparacionesController < ApplicationController
  before_action :set_nota_reparacion, only: [:show, :edit, :update, :destroy]

  # GET /notas_reparaciones
  # GET /notas_reparaciones.json
  def index
    @notas_reparaciones = NotaReparacion.all
  end

  # GET /notas_reparaciones/1
  # GET /notas_reparaciones/1.json
  def show
  end

  # GET /notas_reparaciones/new
  def new
    @nota_reparacion = NotaReparacion.new
    @nota_reparacion.fecha = Date.today

    # Autopopulate with next id to be assigned
    if NotaReparacion.any?
      @nota_reparacion.numeroserie = NotaReparacion.maximum(:id).next
    else
      @nota_reparacion.numeroserie = 1
    end
  end

  # GET /notas_reparaciones/1/edit
  def edit
  end

  # POST /notas_reparaciones
  # POST /notas_reparaciones.json
  def create
    @nota_reparacion = NotaReparacion.new(nota_reparacion_params)

    respond_to do |format|
      if @nota_reparacion.save
        format.html { redirect_to @nota_reparacion, notice: 'Nota reparacion was successfully created.' }
        format.json { render :show, status: :created, location: @nota_reparacion }
      else
        format.html { render :new }
        format.json { render json: @nota_reparacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notas_reparaciones/1
  # PATCH/PUT /notas_reparaciones/1.json
  def update
    respond_to do |format|
      if @nota_reparacion.update(nota_reparacion_params)
        format.html { redirect_to @nota_reparacion, notice: 'Nota reparacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @nota_reparacion }
      else
        format.html { render :edit }
        format.json { render json: @nota_reparacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notas_reparaciones/1
  # DELETE /notas_reparaciones/1.json
  def destroy
    @nota_reparacion.destroy
    respond_to do |format|
      format.html { redirect_to nota_reparaciones_url, notice: 'Nota reparacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nota_reparacion
      @nota_reparacion = NotaReparacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nota_reparacion_params
      params.require(:nota_reparacion).permit(:numeroserie, :fecha, :remito, :detalles_unidades_attributes => [:id, :_destroy, :descripcion, :cantidad, :unidad_id], :detalles_deposito_attributes => [:id, :_destroy, :descripcion, :cantidad, :unidad_id])
    end
end
