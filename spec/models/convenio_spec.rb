require 'spec_helper'

Convenio.destroy_all

describe Convenio do
  it "Pode ser instanciado" do
    Convenio.new.should be_an_instance_of(Convenio)
  end

  it "Pesquisa um convênio por UF" do
  	Convenio.create(:uf => "DISTRITO FEDERAL")
      results = Convenio.search('DISTRITO FEDERAL')

      expect(results.count).to eq(1)
  end

  it { should have_many(:reclamacao) }
	
end


