class UsuariosController < AuthorizedController
  check_authorization
  authorize_resource class: false
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_no_authentication, only: [:new, :create]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.invite!(usuario_params,current_usuario)

    current_taller.add_usuario(@usuario)

    respond_to do |format|
      if @usuario.valid?
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def resend_invitation
    @usuario = Usuario.find(params[:usuario_id])
    Usuario.invite!({ email: "#{@usuario.email}" }, current_user)
    redirect_to usuarios_path, notice: 'Invitación reenviada'
  end

  def active_deactive
    @usuario = Usuario.find(params[:usuario_id])
    @usuario.is_active = @usuario.is_active.blank?

    if @usuario.save!
      redirect_to usuarios_path, notice: 'Usuario Activado/Desactivado'
    else
      redirect_to usuarios_path, notice: 'Error al Activar/desactivar'
    end
  end


  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    if usuario_params[:password].blank?
      usuario_params.delete(:password)
      usuario_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@usuario, usuario_params)
                            @usuario.update(usuario_params)
                          else
                            @usuario.update_without_password(usuario_params)
                          end

    respond_to do |format|
      if successfully_updated
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    current_taller.remove_usuario(@usuario)

    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nombre, :apellido, :email, :password, :password_confirmation, :name,taller_attributes: [:nombre, direcciones_attributes:[ :calle, :altura, :_destroy]], memberships_attributes: [:role_id,:taller_id,:current,:id, :_destroy])
    end

  protected

  def needs_password?(usuario, params)
    params[:password].present?
  end

end
