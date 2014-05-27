
require 'spec_helper'

describe UsuariosController do

  let(:valid_attributes) { { :nome  => "Victor", :cpf => "03713770141", :email => "asdwer@gmail.com", :login => "abcdewerwe", :password => "12345678", :password_confirmation => "12345678"  } }
  login_admin

  describe "GET index" do
    it "assigns all usuarios as @usuarios" do
      usuarios = Usuario.all
      get :index, {}
      expect(assigns(:usuarios)).to eq(usuarios)
    end
  end

  describe "GET new" do
    it "assigns a new usuario as @usuario" do
      usuario = Usuario.create! valid_attributes
      get :new, {}
      expect(assigns(:usuarios)).to be_a_new(Usuario)
    end
  end

  describe "PUT update" do
    describe "with valid params" do

      it "updates the requested usuario" do
        usuario = Usuario.create! valid_attributes
        Usuario.any_instance.should_receive(:update).with("nome"=>"Victor", "cpf"=>"03713770141", "email"=>"asdwer@gmail.com", "login"=>"abcdewerwe")
        put :update, {:id => usuario.to_param, :usuario => valid_attributes }
      end

      it "assigns the requested usuario as @usuario" do
        usuario = Usuario.create! valid_attributes
        put :update, {:id => usuario.to_param, :usuario => valid_attributes}
        assigns(:usuarios).should eq(usuario)
      end
    end

    describe "with invalid params" do
      it "assigns the usuario as @usuario" do
        usuario = Usuario.create! valid_attributes
        Usuario.any_instance.stub(:save).and_return(false)
        put :update, {:id => usuario.to_param, :usuario => {  }}
        assigns(:usuarios).should eq(usuario)
      end
    end
  end


  describe "POST create" do
    describe "with valid params" do
      it "creates a new Usuario" do
        expect {
          usuario = Usuario.create! valid_attributes
          post :create, {:id => usuario.to_param}
        }.to change(Usuario, :count).by(1)
      end


      it "redirects to the created usuario" do

        usuario = Usuario.create! valid_attributes
        post :create, {:usuario => valid_attributes}
        expect(response.status).to be(200)
      end
    end


    describe "with invalid params" do
      it "assigns a newly created but unsaved usuario as @usuario" do
        Usuario.any_instance.stub(:save).and_return(false)
        post :create, {:usuarios => {  }}
        expect(assigns(:usuarios)).to be_a_new(Usuario)
      end

      it "re-renders the 'new' template" do
        Usuario.any_instance.stub(:save).and_return(false)
        post :create, {:usuario => {  }}
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
