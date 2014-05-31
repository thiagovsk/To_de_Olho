require 'spec_helper'

describe ReclamacaoController do

	let (:valid_attributes) do
		{:descricao => "Só tem BR"}
	end

	it "get index" do
    	get :index
    	response.should be_success
  	end

  	it "populates a list of users" do
    get :index
    expect(assigns(:reclamacoes)).to eq([reclamacao])
  end

  describe "GET new" do
    it "assigns a new reclamacao as @reclamacao" do
      get :new
      expect(assigns(:reclamacoes)).to be_a_new(Reclamacao)
    end
  end

  context "PUT update" do
    describe "with valid params" do

      it "updates the requested reclamacao" do
        put :update, :id => reclamacao.to_param, :reclamacao => valid_attributes
        reclamacao.reload
        reclamacao.descricao.should eq(valid_attributes[:descricao])
      end

      it "assigns the requested reclamacao as @reclamacao" do
        reclamacao = reclamacao.create! valid_attributes
        put :update, :id => reclamacao.to_param, :reclamacao => valid_attributes
        reclamacao.reload
        assigns(:reclamacao).should eq(reclamacao)
      end
    end

    describe "with invalid params" do
      it "assigns the reclamacao as @reclamacao" do
        reclamacao = reclamacao.create! valid_attributes
        reclamacao.any_instance.stub(:save).and_return(false)
        put :update, {:id => reclamacao.to_param, :reclamacao => {  }}
        reclamacao.reload
        assigns(:reclamacao).should eq(reclamacao)
      end
    end
  end


  context "POST create" do
    describe "with valid params" do
      it "creates a new reclamacao" do
        expect {
          reclamacao = reclamacao.create! valid_attributes
          post :create, {:id => reclamacao.to_param}
        }.to change(reclamacao, :count).by(1)
      end


      it "redirects to the created reclamacao" do

        reclamacao = reclamacao.create! valid_attributes
        post :create, {:reclamacao => valid_attributes}
        expect(response.status).to be(200)
      end
    end


    describe "with invalid params" do
      it "assigns a newly created but unsaved reclamacao as @reclamacao" do
        reclamacao.any_instance.stub(:save).and_return(false)
        post :create, {:reclamacoes => {  }}
        expect(assigns(:reclamacoes)).to be_a_new(reclamacao)
      end

      it "re-renders the 'new' template" do
        reclamacao.any_instance.stub(:save).and_return(false)
        post :create, {:reclamacao => {  }}
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE" do
    it "destroys the requested reclamacao" do
      expect {
        delete :destroy, {:id => reclamacao.to_param}
      }.to change(reclamacao, :count).by(-1)
    end

    it "redirects to the reclamacaos list" do
      delete :destroy, {:id => reclamacao.to_param}
      expect(response).to redirect_to(reclamacaos_url)
    end
  end



end
