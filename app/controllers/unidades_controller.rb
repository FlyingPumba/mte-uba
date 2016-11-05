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
      #format.xml  { render xml: @unidades }
      #format.json do
      #  @unidades = Unidad.by_taller(current_taller).to_a
      #  render json: @unidades
      #end
    end

  end

  # GET /unidades/1
  # GET /unidades/1.json
  def show
    @choferes = @unidad.choferes.order('apellido desc').paginate(page: params[:page], per_page: 15)
    @nota_pedidos = @unidad.nota_pedidos.paginate(page: params[:page], per_page:15)
    @nota_reparaciones = []
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
    # Never trust parameters from the scary internet, only allow the white list through.
    #def unidad_params_2
     # unidad_chofer_keys = params[:unidad].try(:fetch, :unidad_choferes_attributes, {})
     # permi = [:id, :_destroy,:chofer_id,:turno_id]
     # permitidos_relacion =permit_recursive_params(unidad_chofer_keys)
     # total_permi = permi + permitidos_relacion
     # params.require(:unidad).permit(:patente,:marca,:id,:_destroy,:chofer_id,:turno_id, :año,:fueraDeServicio,unidad_choferes_attributes: total_permi)
      #unidad_choferes_keys = params[:unidad].try(:fetch, :unidad_choferes_attributes, {})
      #params.require(:unidad).permit(:patente,:marca, :año,:fueraDeServicio, unidad_choferes_attributes: permi,unidad_choferes_attributes:[ tor.first => permi, tor.second => permi, tor.last => permi ])
    #end


    #def unidad_params
    #  choferes_attributes = params[:unidad][:unidad_choferes_attributes].keys.each_with_object([]) do |k,memo|
    #   memo << {k => [:id, :_destroy, :chofer_id, :turno_id]}
    #  end
    #  choferes_attributes += [:id, :_destroy, :chofer_id, :turno_id]
    #  params.require(:unidad).permit(:patente, :marca,:año,:fueraDeServicio, unidad_choferes_attributes: choferes_attributes)
    #end

    #def permit_recursive_params(params)
    #  (params.try(:to_unsafe_h) || params).map do |key, value|
    #    if value.is_a?(Array)
    #      value = value.first
    #      if value.is_a?(Array) || value.is_a?(Hash)
    #        { key => [permit_recursive_params(value)]}
    #      else
    #        { key => []}
    #      end
    #    elsif value.is_a?(Hash) || value.is_a?(ActionController::Parameters)
    #     { key => [permit_recursive_params(value)]}
    #    else
    #      key
    #    end
    #  end
    #end


end
