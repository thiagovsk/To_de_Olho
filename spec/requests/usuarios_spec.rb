require 'rails_helper'

RSpec.describe "Usuarios", :type => :request do
  describe "GET /usuarios" do
    it "works! (now write some real specs)" do
      get usuarios_path
      expect(response.status).to be(302)
    end
  end
end
