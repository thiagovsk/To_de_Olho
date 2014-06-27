require 'rails_helper'

RSpec.describe UsuariosController, :type => :controller do

  login_admin
  # This should return the minimal set of attributes required to create a valid
  # Usuario. As you add validations to Usuario, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {:nome => "Usuarioteste", :cpf => "03713770131", :email => "example@te.com.br", :login => "ste", :password => "1234567h", :password_confirmation => "1234567h"}
  }

  let(:invalid_attributes) {
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsuariosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all usuarios as @usuarios" do
      usuario = Usuario.create! valid_attributes
      get "index", {}, valid_session
      expect(assigns(:usuarios)).to eq(Usuario.all)
    end
  end

  describe "GET show" do
    it "assigns the requested usuario as @usuario" do
      usuario = Usuario.create! valid_attributes
      get :show, {:id => usuario.to_param}, valid_session
      expect(assigns(:usuario)).to eq(usuario)
    end
  end

  describe "GET new" do
    it "assigns a new usuario as @usuario" do
      get :new, {}, valid_session
      expect(assigns(:usuario)).to be_a_new(Usuario)
    end
  end

  describe "GET edit" do
    it "assigns the requested usuario as @usuario" do
      usuario = Usuario.create! valid_attributes
      get :edit, {:id => usuario.to_param}, valid_session
      expect(assigns(:usuario)).to eq(usuario)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Usuario" do
        expect {
          post :create, {:usuario => valid_attributes}, valid_session
        }.to change(Usuario, :count).by(0)
      end

      it "assigns a newly created usuario as @usuario" do
        post :create, {:usuario => valid_attributes}
        expect(assigns(:usuario)).to be_a Usuario
        expect(assigns(:usuario)).to be_a_new(Usuario)
      end

      it "redirects to the created usuario" do
        post :create, {:usuario => valid_attributes}, valid_session
        expect(response.status).to be(200)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved usuario as @usuario" do
        post :create, {:usuario => valid_attributes}, valid_session
        expect(assigns(:usuario)).to be_a_new(Usuario)
      end

      it "re-renders the 'new' template" do
        post :create, {:usuario => valid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested usuario" do
        usuario = Usuario.create! valid_attributes
        put :update, {:id => usuario.to_param, :usuario => new_attributes}, valid_session
        usuario.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested usuario as @usuario" do
        usuario = Usuario.create! valid_attributes
        put :update, {:id => usuario.to_param, :usuario => valid_attributes}, valid_session
        expect(assigns(:usuario)).to eq(usuario)
      end

      it "redirects to the usuario" do
        usuario = Usuario.create! valid_attributes
        put :update, {:id => usuario.to_param, :usuario => valid_attributes}, valid_session
        expect(response).to redirect_to(usuarios_url)
      end
    end

    describe "with invalid params" do
      it "assigns the usuario as @usuario" do
        usuario = Usuario.create! valid_attributes
        put :update, {:id => usuario.to_param, :usuario =>  valid_attributes}, valid_session
        expect(assigns(:usuario)).to eq(usuario)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested usuario" do
      usuario = Usuario.create! valid_attributes
      expect {
        delete :destroy, {:id => usuario.to_param}, valid_session
      }.to change(Usuario, :count).by(-1)
    end

    it "redirects to the usuarios list" do
      usuario = Usuario.create! valid_attributes
      delete :destroy, {:id => usuario.to_param}, valid_session
      expect(response).to redirect_to(usuarios_url)
    end
  end

end
