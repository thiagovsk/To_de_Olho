require 'spec_helper'

describe AbaixoAssinadosController,type: :controller do

  login_admin
  @convenio = Convenio.create!(:numeroconvenio => "900037",
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
   :created_at => "2010-10-20", :updated_at => "2013-10-25")
  @usuario = Usuario.create(:nome => "Usuario teste", :cpf => "999.999.99-99",
                            :email => "exam@teste.com.br", :login => "Teste2",
                            :password => "1111111111h", :password_confirmation => "1111111111h")
  let(:valid_attributes) { { :usuario_id => 1, :convenio_id => 1, :titulo => "Reforma Tributaria", :destinatario => "Todos", 
    :termo => "alguma coisa grande aqui"} }
  let(:valid_session) { {} }
  let(:valid_assinatura) { { :usuario_id => 1 ,:abaixo_assinado_id  => 1} }
  

=begin
  describe "Assinaturas lenght" do
    it "Search lenght of assinatures" do
      abaixo_assinados = AbaixoAssinado.create!
      post :assinaturas_length
      expect(response.status).to be(200)
    end
  end
=end



  describe "GET" do
    it "assigns a new AbaixoAssinado as @AbaixoAssinado" do
      get :new, {}, valid_session
      expect(assigns(:abaixo_assinado)).to be_a_new(AbaixoAssinado)
    end
    it "assigns all abaixo_assinados as @abaixo_assinados" do
      abaixo_assinado = AbaixoAssinado.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:abaixo_assinados)).to eq([abaixo_assinado])
    end
    it "show find a abaixo_assinado by the params[:id]" do
      abaixo_assinado = AbaixoAssinado.create! valid_attributes
      get :show, {:id => abaixo_assinado.to_param}, valid_session
      expect(assigns(:abaixo_assinado)).to eq(abaixo_assinado)
    end
    it "info set a @convenio_id by the params[id]" do
      get :info, {:id => @convenio.to_param}, valid_session
      expect(assigns(:convenio_id)).to eq(@convenio.to_param)
    end
  end

  describe "POST assinar" do
    describe "with valid params" do
      it "creates a new Assinatura" do
        expect {
          post :assinar, {:assinatura => valid_assinatura}, valid_session
        }.to change(Assinatura, :count).by(1)
      end

      it "assigns a newly created Assinatura as @assinatura" do
        post :assinar, { :assinatura => valid_assinatura}, valid_session
        response.should redirect_to(home_index_path)
      end

      it "redirects to home" do
        post :assinar, {:assinatura => valid_assinatura}, valid_session
        expect(response.status).to be(302)
      end
    end
    describe "with invalid params" do
      it "assigns a newly created but unsaved AbaixoAssinados as @AbaixoAssinados" do
        Assinatura.any_instance.stub(:save).and_return(false)
        post :assinar, {:assinatura => {  }}, valid_session
        expect(assigns(:assinatura)).to be_a_new(Assinatura)
      end

      it "re-renders the 'new' template" do
        Assinatura.any_instance.stub(:save).and_return(false)
        post :assinar, {:assinatura => {  }}, valid_session
        expect(response.status).to be(302)
      end
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AbaixoAssinado" do
        expect {
          post :create, {:abaixo_assinados => valid_attributes}, valid_session
        }.to change(AbaixoAssinado, :count).by(1)
      end

      it "assigns a newly created AbaixoAssinados as @AbaixoAssinados" do
        post :create, {:abaixo_assinados => valid_attributes}, valid_session
        expect(assigns(:abaixo_assinados)).to be_a(AbaixoAssinado)
        assigns(:abaixo_assinados).should be_persisted
      end

      it "redirects to the created AbaixoAssinados" do
        post :create, {:abaixo_assinados => valid_attributes}, valid_session
        expect(response.status).to be(302)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved AbaixoAssinados as @AbaixoAssinados" do
        AbaixoAssinado.any_instance.stub(:save).and_return(false)
        post :create, {:abaixo_assinados => {  }}, valid_session
        expect(assigns(:abaixo_assinados)).to be_a_new(AbaixoAssinado)
      end

      it "re-renders the 'new' template" do
        AbaixoAssinado.any_instance.stub(:save).and_return(false)
        post :create, {:abaixo_assinados => {  }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end
end
