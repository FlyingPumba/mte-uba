class UnidadesController < AuthorizedController
  before_action :set_unidad, only: [:show, :edit, :update, :destroy]

  # GET /unidades
  # GET /unidades.json
  def index
    @search = Unidad.by_taller(current_taller).search(params[:q])
    @results = @search.result
    @unidades = @results.paginate(page: params[:page], per_page: 15)

    respond_to do |format|
      format.html # index.html.erb
    end

  end

  # GET /unidades/1
  # GET /unidades/1.json
  def show
    @choferes = @unidad.choferes.order('apellido desc').paginate(page: params[:page], per_page: 15)
    @detalles_de_pedidos = @unidad.detalles_unidades.select{|detalle| detalle.detallable_type == "NotaPedido"}
    @nota_pedidos = @detalles_de_pedidos.map{|detalle| NotaPedido.find(detalle.detallable_id)}
    # @nota_pedidos = @nota_pedidos.paginate(page: params[:page], per_page:15)
    @detalles_de_reparaciones = @unidad.detalles_unidades.select{|detalle| detalle.detallable_type == "NotaReparacion"}
    @nota_reparaciones = @detalles_de_reparaciones.map{|detalle| NotaReparacion.find(detalle.detallable_id)}
    @novedades_mecanicas = @unidad.novedades_mecanicas.paginate(page:params[:page], per_page:15)
    # @nota_reparaciones = @nota_reparaciones.paginate(page: params[:page], per_page:15)
  end

  # GET /unidades/new
  def new
    @unidad = current_taller.unidades.build
    #@unidad.unidad_choferes.build
  end

  # GET /unidades/1/edit
  def edit
    #@unidad.unidad_choferes.build
  end

  # POST /unidades
  # POST /unidades.json
  def create
    @unidad = Unidad.new(unidad_params)
    @unidad.update(taller_id: current_taller.id)
    respond_to do |format|
      if @unidad.save
        format.html { redirect_to @unidad, notice: 'Unidad was successfully created.' }
        format.json { render :show, status: :created, location: @unidad }
      else
        format.html { render :new }
        format.json { render json: @unidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unidades/1
  # PATCH/PUT /unidades/1.json
  def update
    respond_to do |format|
      if @unidad.update(unidad_params)
        format.html { redirect_to @unidad, notice: 'Unidad was successfully updated.' }
        format.json { render :show, status: :ok, location: @unidad }
      else
        format.html { render :edit }
        format.json { render json: @unidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unidades/1
  # DELETE /unidades/1.json
  def destroy
    @unidad.destroy
    respond_to do |format|
      format.html { redirect_to unidades_url, notice: 'Unidad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidad
      @unidad = Unidad.find(params[:id])
    end

    def unidad_params
      params.require(:unidad).permit(:patente, :marca,:año,:fueraDeServicio, :unidad_choferes_attributes => [:id, :_destroy,:chofer_id, :turno_id])
    end
end
