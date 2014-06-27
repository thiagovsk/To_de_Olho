require 'rails_helper'
require 'spec_helper'

RSpec.describe HomeController, :type => :controller do

  sign_in

  let(:valid_attributes) {
    {:nome => "Usuario teste", :cpf => "000.000.000-00", :email => "example@teste.com.br", :login => "Teste", :password => "1234567h", :password_confirmation => "1234567h"}
  }
  describe "GET index" do
    it "assigns all usuarios as @usuarios" do
      get :index, {}
      expect(assigns(:usuarios)).to eq(assigns(:usuario))
    end
    it "assigns all usuarios as current_usuario" do
      sign_in FactoryGirl.create(:admin)
      get :index, {}
      expect(@current_usuario).to be_nil
      response.should be_success
    end

  end

  describe "GET show" do
    it "assigns the requested home as top 5 value" do
      get :show
      top_valor = Convenio.order("convenios.valorconvenio desc").limit(5)
      expect(top_valor.count).to eq(0)

    end

    it "assigns the requested home as top 5 data " do
      get :show
      top_data = Convenio.order("convenios.valorconvenio desc").limit(5)
      expect(top_data.count).to eq(0)
    end
  end
end
