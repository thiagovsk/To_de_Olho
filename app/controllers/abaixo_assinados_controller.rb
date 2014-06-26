class AbaixoAssinadosController < ApplicationController
  before_action :set_abaixo_assinado, only: [:show, :assinar]
  helper_method :assinaturas_length

  def index
  	@abaixo_assinados = AbaixoAssinado.all
  end

  def new
  	@abaixo_assinado = AbaixoAssinado.new
  end

  def create
    @abaixo_assinados = AbaixoAssinado.new(abaixo_assinado_params)
    respond_to do |format|
      if @abaixo_assinados.save and Assinatura.new(:usuario_id => current_usuario.id,:abaixo_assinado_id => @abaixo_assinados.id).save
        format.html { redirect_to @abaixo_assinados, notice: 'Abaixo Assinado criado com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def assinar
    @assinatura = Assinatura.new(:usuario_id => current_usuario.id, :abaixo_assinado_id => @abaixo_assinado.id)
    respond_to do |format|
      if @assinatura.save
        format.html { redirect_to home_index_path, notice: 'Assinatura efetuada!' }
      else
        format.html { redirect_to home_index_path, alert: 'Assinatura pode ser efetuada apenas uma vez!' }
      end
    end
  end

  def assinaturas_length(abaixo_assinado_id)
    Assinatura.search_by_abaixo_assinado_id(abaixo_assinado_id).length
  end

  def update
  end

  def show
	
  end

  def edit
  end

  def info
    @convenio_id = params[:convenio_id]
  end

  private
  def abaixo_assinado_params
    params.fetch(:abaixo_assinado, {}).permit(:titulo,:destinatario,:termo,:assinaturas,:convenio_id,:usuario_id)
  end

  def set_abaixo_assinado
    @abaixo_assinado = AbaixoAssinado.find(params[:id])
  end

  def showusuario
    @abaixo_assinado = AbaixoAssinado.find(params[:usuario_id])
  end 

end
