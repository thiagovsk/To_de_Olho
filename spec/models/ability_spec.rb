require 'cancan/matchers'
require 'spec_helper'

describe Usuario do

	describe "ability" do
  
		subject(:ability) {Ability.new(usuario)}
		let(:usuario) {nil}

		context "quando o usuario for administrador" do

			let(:usuario) {FactoryGirl.create(:admin)}
			it "o administrador pode ler todos usuarios" do
				should be_able_to(:read, Usuario.new)
			end

			let(:usuario) {FactoryGirl.create(:admin)}
			it "o administrador pode ler todos usuarios" do
				should be_able_to(:create, Usuario.new)
			end

		end

	end
end
