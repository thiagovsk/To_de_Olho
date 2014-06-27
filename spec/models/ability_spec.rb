require 'cancan/matchers'
require 'spec_helper'

describe "Usuario" do

  describe "abilities" do

    subject(:ability) {Ability.new(usuario)}
    let(:usuario) {nil}

    context "quando o usuario for administrador" do
      let(:usuario) {FactoryGirl.create(:admin)}

      it "pode gerenciar todos usuarios" do
        should be_able_to(:manage, Usuario.new)
      end

      it "pode gerenciar todos convenios" do
        should be_able_to(:manage, Convenio.new)
      end

    end
    context "quando o usuario for padrao" do
      let(:usuario) {FactoryGirl.create(:admin)}

      it "pode ler convenios" do
        should be_able_to(:read, Convenio.new)
      end
    end

  end
end
