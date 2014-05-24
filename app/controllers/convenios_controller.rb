# -*- encoding : utf-8 -*-

class ConveniosController < ApplicationController
  before_action :set_convenio, only: [:show, :edit, :update, :destroy]

  def index

    if params[:search]
      @convenios = Convenio.search(params[:search]).order("created_at DESC")

    else
      @convenios = Convenio.all

    end
  end


  def new
    @convenios = Convenio.new
  end


  def set_convenio
    @convenios = Convenio.find(params[:id])
  end


  def convenio_params
    params.require(:convenio).permit(:numeroconvenio, :uf, :codigosiafi, :nomemunicipio, :situacaoconvenio, :numerooriginal, :objetoconvenio, :codigoorgaosuperior, :nomeorgaosuperior, :codigoconcedente, :nomeconcedente, :codigoconvenente, :nomeconvenente, :tipoenteconvenente, :valorconvenio, :valorliberado, :datapublicacao, :datainiciovigencia, :datafimvigencia, :valorcontrapartida, :dataultimaliberacao, :valorultimaliberacao)
  end
  

  def import
    
    Convenio.import(params[:file])
    redirect_to convenios_url, notice:  "Convenios importados com sucesso"

  end

end
