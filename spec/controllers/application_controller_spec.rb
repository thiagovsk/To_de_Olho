require 'spec_helper'

describe ApplicationController do

  let(:valid_attributes) { { :nome  => "Victor", :cpf => "03713770141", :email => "asdwer@gmail.com", :login => "abcdewerwe", :password => "12345678", :password_confirmation => "12345678"  } }

  describe "after sign in" do
    it "should redirect to home index page" do
      usuario = Usuario.create! valid_attributes
      controller.after_sign_in_path_for(@usuario).should == home_index_path
    end
  end

end