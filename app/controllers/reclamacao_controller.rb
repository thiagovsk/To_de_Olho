# -*- encoding : utf-8 -*-
class ReclamacaoController < ApplicationController
  before_action :set_reclamacao , only:[:show, :edit, :destroy, :update]


  def index
    @reclamacoes = Reclamacao.all
  end

  def new
    @reclamacoes = Reclamacao.new
  end

  def create
    @reclamacoes = Reclamacao.new(reclamacao_params)
    respond_to do |format|
      if @reclamacoes.save
        format.html { redirect_to reclamacao_index_path, notice: 'Reclamação Criada com sucesso' }
      else
        format.html { render :new }
      end
    end
  end


  def destroy
    @reclamacoes.destroy
    respond_to do |format|
      format.html { redirect_to reclamacoes_path, notice: 'Deletado com sucesso' }
    end
  end


  def update
    respond_to do |format|
      if @reclamacoes.update(reclamacao_params)
        format.html { redirect_to reclamacoes_path, notice: 'Alteração realizada com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  private
  def set_reclamacao
    @reclamacoes = Reclamacao.find(params[:id])
  end

  def reclamacao_params
    params.fetch(:reclamacao, {}).permit(:descricao,:convenio,:convenio_id,:usuario,:usuario_id,:foto)
    #Ao invés de utilizar params.require, utilize params.fetch
    #Esse problema é intrínseco ao Rails e é solucionado com o fetch
  end
end
