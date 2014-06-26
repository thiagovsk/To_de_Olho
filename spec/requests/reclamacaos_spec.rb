require 'rails_helper'

RSpec.describe "Reclamacaos", :type => :request do
  describe "GET /reclamacaos" do
    it "works! (now write some real specs)" do
      get reclamacaos_path
      expect(response.status).to be(200)
    end
  end
end
