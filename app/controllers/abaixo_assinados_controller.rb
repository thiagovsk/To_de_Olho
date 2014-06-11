class AbaixoAssinadosController < ApplicationController
  before_action :set_abaixo_assinado , only:[:show, :edit, :destroy, :update]

  def index
  	@abaixo_assinados = AbaixoAssinado.all
  end

  def new
  	@abaixo_assinados = AbaixoAssinado.new
  end

  def show
    @abaixo_assinados = AbaixoAssinado.find(params[:id])
  end

  def create
    @abaixo_assinados = AbaixoAssinado.new(abaixo_assinado_params)
    respond_to do |format|
      if @abaixo_assinados.save
        format.html { redirect_to abaixo_assinados_path, notice: 'Abaixo Assinado Criada com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @abaixo_assinados.destroy
    respond_to do |format|
      format.html { redirect_to abaixo_assinados_path, notice: 'Deletado com sucesso' }
    end
  end


  def update
    respond_to do |format|
      if @abaixo_assinados.update(abaixo_assinado_params)
        format.html { redirect_to abaixo_assinados_path, notice: 'Alteração realizada com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def info
  end

  private
  def set_abaixo_assinado
    @abaixo_assinados = AbaixoAssinado.find(params[:id])
  end

  def abaixo_assinado_params
    params.fetch(:abaixo_assinado, {}).permit(:titulo,:destinatario,:termo,:data,:convenio_id,:usuario_id)
  end

end
