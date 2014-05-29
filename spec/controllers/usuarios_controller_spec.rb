require 'spec_helper'

describe UsuariosController do


  let (:usuario) do
    FactoryGirl.create(:admin)
  end
  let (:usuario_padrao) do
    FactoryGirl.create(:default)
  end
  let (:valid_attributes) do
    {:nome => "Usuario teste", :cpf => "000.000.000-00", :email => "example@teste.com.br", :login => "Teste", :password => "1234567h", :password_confirmation => "1234567h"}
  end

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:usuario]
    sign_in usuario
  end

  after :each do
    sign_out usuario
  end

  it "have a current_user" do
    subject.current_user.should_not be_nil
  end

  it "get index" do
    get :index
    response.should be_success
  end

  it "populates a list of users" do
    get :index
    expect(assigns(:usuarios)).to eq([usuario])
  end

  describe "GET new" do
    it "assigns a new usuario as @usuario" do
      get :new
      expect(assigns(:usuarios)).to be_a_new(Usuario)
    end
  end

  context "PUT update" do
    describe "with valid params" do

      it "updates the requested usuario" do
        put :update, :id => usuario.to_param, :usuario => valid_attributes
        usuario.reload
        usuario.nome.should eq(valid_attributes[:nome])
        usuario.cpf.should eq(valid_attributes[:cpf])
        usuario.email.should eq(valid_attributes[:email])
        usuario.login.should eq(valid_attributes[:login])
      end

      it "assigns the requested usuario as @usuario" do
        usuario = Usuario.create! valid_attributes
        put :update, :id => usuario.to_param, :usuario => valid_attributes
        usuario.reload
        assigns(:usuario).should eq(usuario)
      end
    end

    describe "with invalid params" do
      it "assigns the usuario as @usuario" do
        usuario = Usuario.create! valid_attributes
        Usuario.any_instance.stub(:save).and_return(false)
        put :update, {:id => usuario.to_param, :usuario => {  }}
        usuario.reload
        assigns(:usuario).should eq(usuario)
      end
    end
  end


  context "POST create" do
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

  describe "DELETE" do
    it "destroys the requested usuario" do
      expect {
        delete :destroy, {:id => usuario.to_param}
      }.to change(Usuario, :count).by(-1)
    end

    it "redirects to the usuarios list" do
      delete :destroy, {:id => usuario.to_param}
      expect(response).to redirect_to(usuarios_url)
    end
  end
end

