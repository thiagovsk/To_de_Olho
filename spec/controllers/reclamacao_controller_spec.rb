require 'spec_helper'

RSpec.describe ReclamacaoController, :type => :controller do

  let(:valid_attributes) { { :descricao => "hu3hu3h3uh3u brbrbrb"  } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all reclamacoes as @reclamacoes" do
      reclamacao = Reclamacao.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:reclamacoes)).to eq([reclamacao])
    end
  end


  describe "GET new" do
    it "assigns a new reclamacao as @reclamacao" do
      get :new, {}, valid_session
      expect(assigns(:reclamacoes)).to be_a_new(Reclamacao)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new reclamacao" do
        expect {
          post :create, {:reclamacao => valid_attributes}, valid_session
        }.to change(Reclamacao, :count).by(1)
      end

      it "assigns a newly created reclamacao as @reclamacao" do
        post :create, {:reclamacao => valid_attributes}, valid_session
        expect(assigns(:reclamacoes)).to be_a(Reclamacao)
        assigns(:reclamacoes).should be_persisted
      end

      it "redirects to the created reclamacao" do
        post :create, {:reclamacao => valid_attributes}, valid_session
        expect(response.status).to be(302)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved reclamacao as @reclamacao" do
        Reclamacao.any_instance.stub(:save).and_return(false)
        post :create, {:reclamacoes => {  }}, valid_session
        expect(assigns(:reclamacoes)).to be_a_new(Reclamacao)
      end

      it "re-renders the 'new' template" do
        Reclamacao.any_instance.stub(:save).and_return(false)
        post :create, {:reclamacao => {  }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested reclamacao" do
      reclamacao = Reclamacao.create!
      expect {
        delete :destroy, {:id => reclamacao.to_param}, valid_session
      }.to change(Reclamacao, :count).by(-1)
    end

    it "redirects to the reclamacaos list" do
      reclamacao = Reclamacao.create!
      delete :destroy, {:id => reclamacao.to_param}, valid_session
      expect(response).to redirect_to(home_index_path)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { :descricao => "minha descricao"  }
      }

      it "updates the requested reclamacao" do
        reclamacao = Reclamacao.create! valid_attributes
        put :update, {:id => reclamacao.to_param, :reclamacao => new_attributes}, valid_session
        reclamacao.reload
        expect(Reclamacao.last).to eq(reclamacao)
      end

      it "assigns the requested reclamacao as @reclamacao" do
        reclamacao = Reclamacao.create!
        put :update, {:id => reclamacao.to_param, :reclamacao => valid_attributes}, valid_session
        expect(Reclamacao.last).to eq(reclamacao)
      end

      it "redirects to the reclamacao" do
        reclamacao = Reclamacao.create! valid_attributes
        put :update, {:id => reclamacao.to_param, :reclamacao => valid_attributes}, valid_session
        expect(response).to redirect_to(home_index_path)
      end
    end

    describe "with invalid params" do
      it "assigns the reclamacao as @reclamacao" do
        reclamacao = Reclamacao.create! valid_attributes
        put :update, {:id => reclamacao.to_param, :reclamacao => valid_attributes}, valid_session
        expect(Reclamacao.last).to eq(reclamacao)
      end

    end

  end
end
