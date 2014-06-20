require 'spec_helper'

describe AbaixoAssinadosController,type: :controller do
  let(:valid_attributes) { { :usuario_id => 1  ,:titulo => "AbaixoAssinados",:termo => "Vitor viadão",:destinatario => "Thiago transão"  } }
  let(:valid_session) { {} }

 describe "GET index" do
    it "assigns all abaixo_assinado as @abaixo_assinado" do
      abaixoAssinados = AbaixoAssinado.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:abaixo_assinados)).to eq([abaixoAssinados])
    end
  end

  describe "GET new" do
    it "assigns a new AbaixoAssinados as @AbaixoAssinados" do
      get :new, {}, valid_session
      expect(assigns(:abaixo_assinados)).to be_a_new(AbaixoAssinado)
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
        response.should redirect_to(AbaixoAssinado)
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