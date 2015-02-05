class AbaixoAssinadosController < ApplicationController
  helper_method :assinaturas_length

  def index
    @abaixo_assinados = AbaixoAssinado.all
  end

  def new
    @abaixo_assinado = AbaixoAssinado.new
  end

  def create
    @abaixo_assinados = AbaixoAssinado.new(abaixo_assinado_params)

    if @abaixo_assinados.convenio_id.blank?
      redirect_to abaixo_assinados_path
      flash[:notice] =  'Assinado criado com sucesso'
    else
      respond_to do |format|
        if @abaixo_assinados.save
          Assinatura.create(:usuario_id => current_usuario.id,:abaixo_assinado_id => @abaixo_assinados.id)
          format.html { redirect_to @abaixo_assinados, notice: 'Abaixo Assinado criado com sucesso' }
        else
          format.html { render :new }
        end
      end
    end
  end

  def assinar
    @assinatura = Assinatura.new(assinatura_params)
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

  def show
    @abaixo_assinado = AbaixoAssinado.find(params[:id])
  end

  def showusuario
  end

  def info
    @convenio_id = params[:convenio_id]
  end

  def update
  end

  private
  def abaixo_assinado_params
    params.fetch(:abaixo_assinado, {}).permit(:titulo,:destinatario,:termo,:assinaturas,:convenio_id,:usuario_id)
  end

  def assinatura_params
    params.fetch(:assinatura, {}).permit(:abaixo_assinado_id,:usuario_id)
  end

end
