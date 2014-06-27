require 'spec_helper'


describe Assinatura do
  it "Pode ser instanciado" do
    Assinatura.new.should be_an_instance_of(Assinatura)
  end

  it "Pesquisa assinaturas por ID do abaixo-assinado" do
  	Assinatura.create(:usuario_id => 1, :abaixo_assinado_id => 1)
      results = Assinatura.search_by_abaixo_assinado_id(1)

      expect(results.count).to eq(1)
  end

  it { should belong_to(:abaixo_assinado) }
  it { should belong_to(:usuario) }
  it { should validate_uniqueness_of(:usuario_id).scoped_to(:abaixo_assinado_id)}
	
end

