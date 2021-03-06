class ProveedoresController < AuthorizedController
  before_action :set_proveedor, only: [:show, :edit, :update, :destroy]

  # GET /proveedores
  # GET /proveedores.json
  def index
    @search = Proveedor.by_taller(current_taller).search(params[:q])
    @results = @search.result
    @proveedores = @results.paginate(page: params[:page], per_page: 15)

    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render xml: @unidades }
      #format.json do
      #  @unidades = Unidad.by_taller(current_taller).to_a
      #  render json: @unidades
      #end
    end

  end

  # GET /proveedores/1
  # GET /proveedores/1.json
  def show
  end

  # GET /proveedores/new
  def new
    @proveedor = current_taller.proveedores.build
  end

  # GET /proveedores/1/edit
  def edit
  end

  # POST /proveedores
  # POST /proveedores.json
  def create
    @proveedor = current_taller.proveedores.build(proveedor_params)

    respond_to do |format|
      if @proveedor.save
        format.html { redirect_to @proveedor, notice: 'Proveedor was successfully created.' }
        format.json { render :show, status: :created, location: @proveedor }
      else
        format.html { render :new }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proveedores/1
  # PATCH/PUT /proveedores/1.json
  def update
    respond_to do |format|
      if @proveedor.update(proveedor_params)
        format.html { redirect_to @proveedor, notice: 'Proveedor was successfully updated.' }
        format.json { render :show, status: :ok, location: @proveedor }
      else
        format.html { render :edit }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proveedores/1
  # DELETE /proveedores/1.json
  def destroy
    @proveedor.destroy
    respond_to do |format|
      format.html { redirect_to proveedores_url, notice: 'Proveedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proveedor
      @proveedor = Proveedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proveedor_params
      params.require(:proveedor).permit(:nombre, :taller_id, :direcciones_attributes => [:id, :_destroy, :calle, :altura])
    end
end
