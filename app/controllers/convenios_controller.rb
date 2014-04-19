class ConveniosController < ApplicationController

private

def set_convenio
@convenio = Convenio.find(params[:id])
end
 

def convenio_params
params.require(:convenio).permit(:numeroconvenio, :uf, :codigosiafi, :nomemunicipio, :situacaoconvenio, :numerooriginal, :objetoconvenio, :codigoorgaosuperior, :nomeorgaosuperior, :codigoconcedente, :nomeconcedente, :codigoconvenente, :nomeconvenente, :tipoenteconvenente, :valorconvenio, :valorliberado, :datapublicacao, :datainiciovigencia, :datafimvigencia, :valorcontrapartida, :dataultimaliberacao, :valorultimaliberacao)
end
 
end



