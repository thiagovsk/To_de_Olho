require 'spec_helper'

describe HomeController do

  let(:valid_attributes) { { :nome  => "Victor", :cpf => "03713770141", :email => "asdwer@gmail.com", :login => "abcdewerwe", :password => "12345678", :password_confirmation => "12345678"  } }

  describe "GET index" do
    it "assigns all usuarios as @usuarios" do
      usuario = Usuario.create! valid_attributes
      get :index, {}
      expect(assigns(:usuarios)).to eq([usuario])
    end
  end
=begin

  describe "GET show" do
    it "assigns the requested usuario as @usuario" do
      usuario = Usuario.create valid_attributes
      get :show, {:id => usuario.to_param}
      response.should render_template("show")
    end
  end
=end

end
