require 'spec_helper'



describe ReclamacaoController do


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

        }.to change(reclamacao, :count).by(1)

      end



      it "assigns a newly created reclamacao as @reclamacao" do

        post :create, {:reclamacao => valid_attributes}, valid_session

        expect(assigns(:reclamacoes)).to be_a(Reclamacao)

        assigns(:reclamacoes).should be_persisted

      end



      it "redirects to the created reclamacao" do

        post :create, {:reclamacao => valid_attributes}, valid_session

        response.should redirect_to(new_reclamacao_path)

      end

    end



    describe "with invalid params" do

      it "assigns a newly created but unsaved reclamacao as @reclamacao" do

        reclamacao.any_instance.stub(:save).and_return(false)

        post :create, {:reclamacoes => {  }}, valid_session

        expect(assigns(:reclamacoes)).to be_a_new(Reclamacao)

      end



      it "re-renders the 'new' template" do

        reclamacao.any_instance.stub(:save).and_return(false)

        post :create, {:reclamacao => {  }}, valid_session

        expect(response).to render_template("new")

      end

    end

  end

end