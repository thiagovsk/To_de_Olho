require 'spec_helper'

describe Reclamacao do
  #pending "add some examples to (or delete) #{__FILE__}"
  
  it "Pode ser instanciado" do
    Reclamacao.new.should be_an_instance_of(Reclamacao)
  end

  it { should belong_to(:convenio) }

end
