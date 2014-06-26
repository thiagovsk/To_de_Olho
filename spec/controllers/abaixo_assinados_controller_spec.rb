require 'spec_helper'

describe AbaixoAssinadosController,type: :controller do

  login_admin
  @convenio = Convenio.create!
  @usuario = Usuario.create(:nome => "Usuario teste", :cpf => "999.999.99-99",
                            :email => "exa@teste.com.br", :login => "Tes",
                            :password => "1111111111h", :password_confirmation => "1111111111h")

  let(:valid_attributes) { { :titulo => "AbaixoAssinados",:termo => "Vitor ",:destinatario => "Thiago " , :usuario_id => 1 ,:convenio_id  => 1} }
  let(:valid_session) { {} }
  let(:valid_aassinatura) { { :usuario_id => 1 ,:abaixo_assinado.id  => 1} }


=begin
  describe "Assinaturas lenght" do
    it "Search lenght of assinatures" do
      abaixo_assinados = AbaixoAssinado.create!
      post :assinaturas_length
      expect(response.status).to be(200)
    end
  end
=end



  describe "GET new" do
    it "assigns a new AbaixoAssinados as @AbaixoAssinados" do
      get :new, {}, valid_session
      expect(assigns(:abaixo_assinado)).to be_a_new(AbaixoAssinado)
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
