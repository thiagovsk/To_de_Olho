require 'spec_helper'

describe AbaixoAssinado do
  it "Pode ser instanciado" do
    AbaixoAssinado.new.should be_an_instance_of(AbaixoAssinado)
  end

  it { should have_many(:assinaturas) }
  it { should belong_to(:usuario) }
  it { should belong_to(:convenio) }
	
end
