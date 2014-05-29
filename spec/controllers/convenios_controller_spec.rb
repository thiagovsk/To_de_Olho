require 'spec_helper'

describe ConveniosController do

  let(:valid_attributes) { {:id => 1, :numeroconvenio => "900037",
   :uf => "SC", :codigosiafi => "8255", :nomemunicipio => "Brasilia",
   :situacaoconvenio => "Em execucao", :numerooriginal => "05520/2009",
   :objetoconvenio => "Pavimentacao", :codigoorgaosuperior => "22000",
   :nomeorgaosuperior => "MINIST. DA AGRICUL..PECUARIA E ABASTECIMENTO ",
   :codigoconcedente => "135098", :nomeconcedente => "CAIXA ECONOMICA FEDERAL/MA ",
   :codigoconvenente => "82827148000169", :nomeconvenente => "MUNICIPIO DE PINHEIRO PRETO ",
   :tipoenteconvenente => "'M' (municipal)", :valorconvenio => "97500.00",
   :valorliberado => "97500.00", :datapublicacao => "2010-01-28", :datainiciovigencia => "2009-12-31",
   :datafimvigencia => "2014-12-31 ", :valorcontrapartida => "19690.29 ",
   :dataultimaliberacao => "2011-12-28", :valorultimaliberacao => "97500.00",
   :created_at => "2010-10-20", :updated_at => "2013-10-25"} }

  let(:valid_session) { {} }

  describe "GET index" do
    
    it "assigns search convenios as @convenios" do
      convenios = Convenio.create! valid_attributes
      get :index, {search:"SC"}, valid_session
      assigns(:convenios).should eq([convenios])
    end

    it "assigns all convenios as @convenios" do
      convenios = Convenio.create! valid_attributes
      get :index, {}, valid_session
      assigns(:convenios).should eq([convenios])
    end

  end

  describe "GET new" do
    it "assigns a new convenio as @convenio" do
      get :new, {}, valid_session
      assigns(:convenios).should be_a_new(Convenio)
    end
  end

end
