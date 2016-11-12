class NovedadMecanicasController < ApplicationController
  before_action :set_novedad_mecanica, only: [:show, :edit, :update, :destroy]
  before_action :set_unidad

  # GET /novedad_mecanicas
  # GET /novedad_mecanicas.json
  def index
    #@novedad_mecanicas = NovedadMecanica.all
  end

  # GET /novedad_mecanicas/1
  # GET /novedad_mecanicas/1.json
  def show
  end

  # GET /novedad_mecanicas/new
  def new
    @novedad_mecanica = @unidad.novedades_mecanicas.build
  end

  # GET /novedad_mecanicas/1/edit
  def edit
  end

  # POST /novedad_mecanicas
  # POST /novedad_mecanicas.json
  def create
    @novedad_mecanica = @unidad.novedades_mecanicas.build(novedad_mecanica_params)

    respond_to do |format|
      if @novedad_mecanica.save
        format.html { redirect_to [@unidad,@novedad_mecanica], notice: 'Novedad mecanica was successfully created.' }
        format.json { render :show, status: :created, location: @novedad_mecanica }
      else
        format.html { render :new }
        format.json { render json: @novedad_mecanica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /novedad_mecanicas/1
  # PATCH/PUT /novedad_mecanicas/1.json
  def update
    respond_to do |format|
      if @novedad_mecanica.update(novedad_mecanica_params)
        format.html { redirect_to [@unidad,@novedad_mecanica], notice: 'Novedad mecanica was successfully updated.' }
        format.json { render :show, status: :ok, location: @novedad_mecanica }
      else
        format.html { render :edit }
        format.json { render json: @novedad_mecanica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /novedad_mecanicas/1
  # DELETE /novedad_mecanicas/1.json
  def destroy
    @novedad_mecanica.destroy
    respond_to do |format|
      format.html { redirect_to unidad_url(@unidad), notice: 'Novedad mecanica was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_novedad_mecanica
      @novedad_mecanica = NovedadMecanica.find(params[:id])
    end

    def set_unidad
      @unidad = Unidad.find(params[:unidad_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def novedad_mecanica_params
      params.require(:novedad_mecanica).permit(:observacion, :fecha)
    end
end
