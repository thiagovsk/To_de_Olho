require 'spec_helper'

describe UsuariosController do

  let(:valid_attributes) { { :nome  => "Victor", :cpf => "12345678900", :email => "asdwer@gmail.com", :login => "abcdewerwe", :senha => "abcsdfdsw"  } }

  let(:valid_session) {  }

  describe "GET index" do
    it "assigns all usuarios as @usuarios" do
      usuario = Usuario.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:usuarios)).to eq([usuario])
    end
  end

  describe "GET new" do
    it "assigns a new usuario as @usuario" do
      get :new, {}, valid_session
      expect(assigns(:usuarios)).to be_a_new(Usuario)
    end
  end

  
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Usuario" do
        expect {
          post :create, {:usuario => valid_attributes}, valid_session
        }.to change(Usuario, :count).by(1)
      end

      it "assigns a newly created usuario as @usuario" do
        post :create, {:usuario => valid_attributes}, valid_session
        expect(assigns(:usuarios)).to be_a(Usuario)
        assigns(:usuarios).should be_persisted
      end

      it "redirects to the created usuario" do
        post :create, {:usuario => valid_attributes}, valid_session
        response.should redirect_to(new_usuario_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved usuario as @usuario" do
        Usuario.any_instance.stub(:save).and_return(false)
        post :create, {:usuarios => {  }}, valid_session
        expect(assigns(:usuarios)).to be_a_new(Usuario)
      end

      it "re-renders the 'new' template" do
        Usuario.any_instance.stub(:save).and_return(false)
        post :create, {:usuario => {  }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested usuario" do
      usuario = Usuario.create! valid_attributes
      expect {
        delete :destroy, {:id => usuario.to_param}
      }.to change(Usuario, :count).by(-1)
    end

    it "redirects to the usuarios list" do
      usuario = Usuario.create! valid_attributes
        delete :destroy, {:id => usuario.to_param}
      expect(response).to redirect_to(usuarios_url)
    end
  end
end
