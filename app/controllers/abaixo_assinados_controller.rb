class AbaixoAssinadosController < ApplicationController
  before_action :set_abaixo_assinado, only: [:show, :assinar]
  before_action :set_assinatura, only: [:index]

  def index
  	@abaixo_assinados = AbaixoAssinado.all
  end

  def new
  	@abaixo_assinado = AbaixoAssinado.new
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

  def update
  end

  def show
	
  end 

  def edit
  end

  def info
  end

  private
  def abaixo_assinado_params
    params.fetch(:abaixo_assinado, {}).permit(:titulo,:destinatario,:termo,:assinaturas,:convenio_id,:usuario_id)
  end

  def set_abaixo_assinado
    @abaixo_assinado = AbaixoAssinado.find(params[:id])
  end

  def set_assinatura
    @assinaturas = Assinatura.all
  end

  

end
