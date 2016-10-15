class TalleresController < AuthorizedController
  respond_to :html

  # GET /my_taller
  def edit
    @taller = current_taller
    respond_with(@taller)
  end
  # PATCH/PUT /my_taller
  # PATCH/PUT /my_taller.json
  def update
    @taller = current_taller
    flash[:notice] = t('flash.actions.update.notice', resource_name: Taller.model_name.human) if @taller.update_attributes(taller_params)
    respond_with(@taller)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def taller_params
      params.require(:taller).permit(:nombre,direcciones_attributes:[ :calle, :altura, :_destroy,:id])
    end

end
