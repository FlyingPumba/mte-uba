class DetallesUnidadesController < ApplicationController
  before_action :set_detalle, only: [:show, :edit, :update, :destroy]

  # GET /detalles_unidades
  # GET /detalles_unidades.json
  def index
    @detalles = DetalleUnidad.all
  end

  # GET /detalles_unidades/1
  # GET /detalles_unidades/1.json
  def show
  end

  # GET /detalles_unidades/new
  def new
    @detalle = DetalleUnidad.new
  end

  # GET /detalles_unidades/1/edit
  def edit
  end

  # POST /detalles_unidades
  # POST /detalles_unidades.json
  def create
    @detalle = DetalleUnidad.new(detalle_params)

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

  # PATCH/PUT /detalles_unidades/1
  # PATCH/PUT /detalles_unidades/1.json
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

  # DELETE /detalles_unidades/1
  # DELETE /detalles_unidades/1.json
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
      @detalle = DetalleUnidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_params
      params.require(:detalle).permit(:cantidad)
    end
end
