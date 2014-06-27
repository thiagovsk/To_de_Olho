require 'rails_helper'

RSpec.describe "Homes", :type => :request do
  describe "GET /homes" do
    it "works! (now write some real specs)" do
      get home_index_path
      expect(response.status).to be(302)
    end
  end
end
