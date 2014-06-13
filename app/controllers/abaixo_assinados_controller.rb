class AbaixoAssinadosController < ApplicationController
 
  def index
  	@abaixo_assinados = AbaixoAssinado.all
  end

  def new
  	@abaixo_assinados = AbaixoAssinado.new
  end

  def create
    @abaixo_assinados = AbaixoAssinado.new(abaixo_assinado_params)
    respond_to do |format|
      if @abaixo_assinados.save
	if(Assinatura.new(:usuario_id => current_usuario.id,:abaixo_assinado_id => @abaixo_assinados.id).save)
          format.html { redirect_to @abaixo_assinados, notice: 'Abaixo Assinado criado com sucesso' }
	else
	  format.html { redirect_to new_abaixo_assinado_path, notice: 'Erro ao atribuir assinatura' }
	end
      else
        format.html { render :new }
      end
    end
  end

  def destroy
  end

  def update
  end

  def show
	@abaixo_assinados = AbaixoAssinado.find(params[:id])
  end 

  def edit
  end

  def info
  end

  private
  def abaixo_assinado_params
    params.fetch(:abaixo_assinado, {}).permit(:titulo,:destinatario,:termo,:data,:assinaturas,:convenio_id,:usuario_id)
  end

end
